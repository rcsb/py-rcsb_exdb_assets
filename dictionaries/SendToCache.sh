#!/bin/bash
#
cp rcsb_mmcif_ext_v1.dic  ../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
#
cd DEPRECATED
cat *.tdic >> ../../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
#
cd ../ENTITY_TYPE_SPECIFIC_CATEGORIES
cat *.tdic >> ../../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
#
cd ../CONTAINER_IDENTIFIER_CATEGORIES
cat *.tdic >> ../../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
#
cd ../FEATURE_CATEGORIES
cat *.tdic >> ../../../py-rcsb_db/CACHE/dictionaries/rcsb_mmcif_ext_v1.dic
#