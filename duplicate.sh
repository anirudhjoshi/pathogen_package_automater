#!/bin/sh

return_dir=`pwd`

cp packaged/* $1

cd $return_dir

ret=$?
if [ $ret -ne 0 ]; then
	echo && echo "PATHOGEN_PACKAGE_NAME failed to duplicate." >&2
else
	 echo && echo "PATHOGEN_PACKAGE_NAME was duplicated - look in $1"
fi

exit $ret
