#!/bin/sh

PATHOGEN_PACKAGE_NAME="vim-clojure"
PATHOGEN_PACKAGE_SHORT_DESCRIPTION="Vim runtime files for clojure" 
PATHOGEN_PACKAGE_NAME_URL="http://www.vim.org/scripts/script.php?script_id=2501"
YOUR_GITHUB_USERNAME="anirudhjoshi"
ORIGIN_GITHUB_USERNEM="vim-scripts"

return_dir=`pwd`

cp lib/* packaged/

cd packaged

escape() {
echo $1 | sed -e 's/\(\.\|\/\|\*\|\[\|\]\|\\\)/\\&/g'
}

sed -i "s/PATHOGEN_PACKAGE_NAME/$(escape $PATHOGEN_PACKAGE_NAME)/g" *
sed -i "s/PATHOGEN_PACKAGE_SHORT_DESCRIPTION/$(escape $PATHOGEN_PACKAGE_SHORT_DESCRIPTION)/g" *
sed -i "s/PATHOGEN_PACKAGE_NAME_URL/$(escape $PATHOGEN_PACKAGE_NAME_URL)/g" *
sed -i "s/YOUR_GITHUB_USERNAME/$(escape $YOUR_GITHUB_USERNAME)/g" *
sed -i "s/ORIGIN_GITHUB_USERNAME/$(escape $ORIGIN_GITHUB_USERNAME)/g" *

cd $return_dir

ret=$?
if [ $ret -ne 0 ]; then
	echo && echo "PATHOGEN_PACKAGE_NAME failed to build." >&2
else
	 echo && echo "PATHOGEN_PACKAGE_NAME was built - look in packaged/"
fi

exit $ret
