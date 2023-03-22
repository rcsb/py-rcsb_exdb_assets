##
# File reformat.py
# Add boilerplate to extension dictionaries
##

import glob
import os


def reformat(fp, dictName):

    template = f"""
data_{dictName}

_pdbx_dictionary_component.datablock_id   {dictName}
_pdbx_dictionary_component.dictionary_component_id  {dictName}
_pdbx_dictionary_component.title          "RCSB extension dictionary: {dictName}"
_pdbx_dictionary_component.version        1.0.0

loop_
_pdbx_dictionary_component_history.dictionary_component_id
_pdbx_dictionary_component_history.version
_pdbx_dictionary_component_history.update
_pdbx_dictionary_component_history.revision
{dictName}  1.0.0  2021-10-05
;
Changes: (JW)
+ Migrate to included dictionary packaging
;

"""
    fp.write(template)


def addComponentHistory():
    pthL = glob.glob("*/*.tdic")
    for pth in pthL:
        ofp = pth.replace(".tdic", ".dic")
        dictName = os.path.basename(ofp)
        with open(pth, "r", encoding="utf-8") as ifh, open(ofp, "w", encoding="utf-8") as ofh:
            reformat(ofh, dictName)
            for line in ifh:
                ofh.write(line)
        #
        # os.remove(pth)


if __name__ == "__main__":
    pthL = glob.glob("*/*.dic")
    for pth in pthL:
        dictName = os.path.basename(pth)
        urlPrefix = "https://raw.githubusercontent.com/rcsb/py-rcsb_exdb_assets/master/dictionary_files/extensions"
        url = os.path.join(urlPrefix, pth)
        print(f"{dictName:60} {url:180} extend  . .")
