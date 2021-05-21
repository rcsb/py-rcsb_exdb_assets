#!/bin/bash
#
cp rcsb_mmcif_ext_base.dic  rcsb_mmcif_ext_v1.dic
#
cd DEPRECATED
cat *.tdic >> ../rcsb_mmcif_ext_v1.dic
#
cd ../ENTITY_TYPE_SPECIFIC_CATEGORIES
cat *.tdic >> ../rcsb_mmcif_ext_v1.dic
#
cd ../CONTAINER_IDENTIFIER_CATEGORIES
cat *.tdic >> ../rcsb_mmcif_ext_v1.dic
#
cd ../FEATURE_CATEGORIES
cat *.tdic >> ../rcsb_mmcif_ext_v1.dic
#
cd ../RELATED_ANNOTATION_CATEGORIES
cat *.tdic >> ../rcsb_mmcif_ext_v1.dic
#
cd ../REPOSITORY_HOLDINGS
cat *.tdic >> ../rcsb_mmcif_ext_v1.dic
#
cd ..
cp rcsb_mmcif_ext_v1.dic ../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
cp rcsb_mmcif_ext_v1.dic ../../py-rcsb_utils_dictionary/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
#