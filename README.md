# RCSB ExDB Assets

## A collection data assets supporting RCSB Exchange Database Utility Classes

## Introduction

This module contains a collection of configuration, dictionary and data assets supporting processing and loading of  both PDB repository and derived data content using relational and document database stores.

## Updating and Generating Schemas

The process of updating schemas involves two main steps: (1) Updating the relevant dictionary definitions, and (2) Generating the schema files based on the updated dictionary files.

### Updating Dictionary Files

All dictionary files used for schemas are found under the `dictionary_files` directory. The final "production-level" dictionary files are stored under `dictionary_files/dist`, which are composed from merging a set of the smaller component dictionary files together (e.g., those under `base` and `extension`).

Accordingly, the general set of steps for updating the dictionary files are as follows:
1. Update the relevant dictionary file under `dictionary_files`. This could either be the `base` `core` dictionary file (`dictionary_files/base/rcsb_mmcif_ext-core.dic`) or an `extensions` dictionary file (`dictionary_files/extensions/*`).
    - Also be sure to update the version information at the top of the file
2. Update the `base` `header` dictionary file: `dictionary_files/base/rcsb_mmcif_ext-header.dic`
    - This simply involves updating the version and description of changes
3. Generate the `dist` dictionary by running the `Build.sh` script:
   - From the `dictionary_files` directory, run: `./scripts/Build.sh rcsb_mmcif_ext local`

### Generating Schema Files

Once the dictionary files are updated, the schema files can be generated.

Before generating the schema files, several things should be configured/set-up first:
1. Make sure the configuration file, `./config/exdb-config-example.yml`, exists and points to local `py-rcsb_exdb_assets` directory tree
    - If the config file is not present, copy it from https://github.com/rcsb/py-rcsb_db/blob/master/rcsb/db/config/exdb-config-example.yml
2. Make sure the `schema_update_cli` command is installed.
    - If not, get it by installing the `rcsb.db` package: `pip install rcsb.db`

Once the above are confirmed, the general steps for generating the schema files are as follows:
1. Make any necessary changes to the schema configuration file: `./config/exdb-config-schema.yml`
    - Even if no direct schema changes are necessary, be sure to update the version number (`major.minor.patch`) of the corresponding collection schema that is being updated based on the dictionary updates, e.g.:

```
pdbx_core:
  - NAME: pdbx_core_entry
    VERSION: 9.0.1
```

2. From the top directory of `py-rcsb_exdb_assets`, run the schema generation command (adjusting the arguments as necessary):
    - This will create a directory `CACHE` with the new schema files found under `CACHE/json_schema_definitions/` and `CACHE/schema_definitions/`

```
# First run it for 'pdbx_core' schemas:
schema_update_cli   --encoding_types rcsb,json,bson --validation_levels full,min  --update_pdbx_core  --cache_path CACHE --config_path ./config/exdb-config-example.yml --config_name site_info_configuration

# Next run it for 'pdbx_comp_model_core' schemas:
schema_update_cli   --encoding_types rcsb,json,bson --validation_levels full,min  --update_pdbx_comp_model_core  --cache_path CACHE --config_path ./config/exdb-config-example.yml --config_name site_info_configuration
```

3. Copy the newly generated schema files into corresponding directories in `py-rcsb_exdb_assets`:
    - `cp CACHE/json_schema_definitions/* json_schema_definitions/`
    - `cp CACHE/schema_definitions/* schema_definitions/`
4. Create a PR to this repository (`py-rcsb_exdb_assets`) with the new dictionary and schema files
    - Once approved, create a parallel PR to [rcsb-mojave-model](https://github.com/rcsb/rcsb-mojave-model), with the relevant files copied to their corresponding directories under [schemas/exchange](https://github.com/rcsb/rcsb-mojave-model/tree/master/schemas/exchange)
