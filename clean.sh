#!/bin/sh

return_dir=`pwd`

cd packaged

rm -f install.sh uninstall.sh readme.md update.sh

cd $return_dir

ret=$?
if [ $ret -ne 0 ]; then
	echo && echo "Failed to clean packaged/" >&2
else
	 echo && echo "Sucessfully cleaned packaged/"
fi

exit $ret
