This project automates the creation of install/update/uninstall scripts and the readme.md for vim-pathogen packages.

## Usuage

### To build

Fill out the variables in build.sh with your details (username/package name|url|description)

```bash
./build.sh
```

Then copy paste the build in packaged/ to the root of your vim-pathogen package.

### To update all packages

```bash
curl https://raw.github.com/anirudhjoshi/pathogen_package_automater/master/update_all.sh | sh
```

or if you have the repo

```bash
./update_all.sh
```
