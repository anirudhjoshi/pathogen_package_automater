#!/bin/sh

return_dir=`pwd`

cd ~/.vim/autoload/
wget -qN https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.    vim

if grep -qEe '(filetype plugin off|call pathogen#infect\(\)|filetype indent     on)' ~/.vimrc
then
        echo "Pathogen already in .vimrc. Passing..." && echo
else
        sed -i '1i filetype plugin off\ncall pathogen#infect()\nfiletype ind    ent on' ~/.vimrc
        echo "Prepended pathogen init to .vimrc." && echo
fi


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
