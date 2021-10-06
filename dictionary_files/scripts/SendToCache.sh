#!/bin/bash
# File: SendToCache.sh
#       Convenience method to update local dictionary cache files in py-rcsb-db and py-rcsb-utils-dictionary
##
curdir=$pwd
TOPDIR="$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
#echo $TOPDIR
# copy to the dictionary cache of related projects
cd $TOPDIR
#
# rcsb_mmcif_ext
#
cp ./dist/rcsb_mmcif_ext.dic ../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
cp ./dist/rcsb_mmcif_ext.dic ../../py-rcsb_utils_dictionary/rcsb/utils/tests-dictionary/test-output/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
#
# Legacy location (deprecated)
cp ./dist/rcsb_mmcif_ext.dic ../dictionaries/rcsb_mmcif_ext_v1.dic
#
echo "Updated cached dictionary rcsb_mmcif_ext"
# rcsb_mmcif_comp_model_ext
#
cp ./dist/rcsb_mmcif_comp_model_ext.dic ../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_comp_model_ext.dic
cp ./dist/rcsb_mmcif_comp_model_ext.dic ../../py-rcsb_utils_dictionary/rcsb/utils/tests-dictionary/test-output/CACHE/dictionaries/rcsb_mmcif_comp_model_ext.dic
#
# Legacy location (deprecated)
cp ./dist/rcsb_mmcif_ext.dic ../dictionaries/rcsb_mmcif_comp_model_ext.dic
#
echo "Updated cached dictionary rcsb_mmcif_comp_model_ext"
cd $pwd
#