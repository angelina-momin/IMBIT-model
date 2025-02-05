<h1 align="center"> Changelog </h1>

All notable changes to this project will be documented in 
this file.
Please refer to [version naming convention](README.md#about) 
to learn more about the version naming convention used.

Please add in dates in the format `YYYY-MM-DD` when listing
versions to this document.

## [v1.0.0](https://github.com/angelina-momin/IMBIT-model/releases/tag/v1.0.0) (2025-02-05)

### Added
- Preprocessed Boris' data files in `data/input/farm_data` folder.

- Utility file `Spillover.nls` containing functions to load farm data, load induce spillover of infections

- `CHANGELOG.md` logging the changes in each version of the model. 

### Updated
- `Corona.nlogo` now loads farm data map, load and visualizes animal infections
and accounts for the spillover of infections from animals to humans.

## [v0.1.0](https://github.com/angelina-momin/IMBIT-model/releases/tag/v0.1.0) (2025-02-05)

### Restructured
- Data- Created `data/input` and `data/output` folders. 
Moved the respective files to the subfolders and updated functions is `input.nls` file to reflect changes in the file directories. 

- Utils- All utility files were moved to `utils` folder.

### Added

- Added .gitignore file to ignore .DS_Store and data output files

## [v0.0.0](https://github.com/angelina-momin/IMBIT-model/releases/tag/v0.0.0) (2025-02-05)

### Added
- Uploaded the original version of the code