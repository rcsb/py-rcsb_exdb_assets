import os
from rcsb.utils.io.FileUtil import FileUtil
from rcsb.utils.io.MarshalUtil import MarshalUtil
import argparse

HERE = os.path.abspath(os.path.dirname(__file__))

fU = FileUtil(workPath=HERE)
mU = MarshalUtil(workPath=HERE)


def main(inputScanFileL, mergedOutputFile):
    #
    mergedTypeMapD = {}
    #
    for pth in inputScanFileL:
        scanTypeD = mU.doImport(pth, fmt="json")
        for cat, attrs in scanTypeD.items():
            if cat not in mergedTypeMapD:
                mergedTypeMapD.update({cat: attrs})
            else:
                for attr, attrD in attrs.items():
                    if attr not in mergedTypeMapD[cat]:
                        mergedTypeMapD[cat].update({attr: attrD})
    #
    mU.doExport(mergedOutputFile, mergedTypeMapD, fmt="json")
    print("Merged output file:", mergedOutputFile)


class CustomFormatter(argparse.ArgumentDefaultsHelpFormatter, argparse.RawTextHelpFormatter):
    pass


if __name__ == "__main__":
    #
    parser = argparse.ArgumentParser(description='Merge two or more scan-*-type-map JSON files.', formatter_class=CustomFormatter)
    parser.add_argument('-i', '--input-files', help='Input scan files to merge, space-separated.', required=False, nargs='+', metavar='', type=str,
                        default=["scan-pdbx-type-map.json", "scan-pdbx_comp_model_core-type-map.json"])
    parser.add_argument('-o', '--output-file', help='Output merged scan file', required=False, type=str,
                        default="scan-pdbx_merged-type-map.json")

    args = parser.parse_args()

    # Process arguments (determine if specific paths provided or using default directory of data_type_and_coverage)
    inputFileL = []
    for inFile in args.input_files:
        if fU.getFileName(inFile) == fU.getFilePath(inFile):
            inputFileL.append(os.path.join(HERE, inFile))
        else:
            inputFileL.append(inFile)
    #
    if fU.getFileName(args.output_file) == fU.getFilePath(args.output_file):
        outputFile = os.path.join(HERE, args.output_file)
    else:
        outputFile = args.output_file

    print("Merging input files:", ", ".join(inputFileL))

    main(inputFileL, outputFile)
