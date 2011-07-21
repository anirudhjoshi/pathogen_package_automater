#!/bin/sh

return_dir=`pwd`

cd ~/.vim/bundle

for i in `ls`
 do
 if [ -d $i ]
  then
   echo "Pulling updates for $i"
   cd $i
   git pull
   cd ..
 fi
done

cd $return_dir

ret=$?
if [ $ret -ne 0 ]; then
	echo && echo "Updates failed to pull." >&2
else
	 echo && echo "Successfully updated."
fi

exit $ret
