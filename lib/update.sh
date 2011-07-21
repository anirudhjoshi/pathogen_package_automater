#!/bin/sh

return_dir=`pwd`

echo && echo "Downloading updated pathogen." && echo

cd ~/.vim/autoload/
wget -qN https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

if grep -qEe '(filetype plugin off|call pathogen#infect\(\)|filetype indent on)' ~/.vimrc
then
	echo "Pathogen already in .vimrc. Passing..." && echo
else

	sed -i '1i filetype plugin off\ncall pathogen#infect()\nfiletype indent on' ~/.vimrc
	
	echo "Prepended pathogen init to .vimrc." && echo
fi

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

if [ -d "PATHOGEN_PACKAGE_NAME" -a -w "PATHOGEN_PACKAGE_NAME" ]
then

	echo "PATHOGEN_PACKAGE_NAME already exists. Updating..." && echo
	cd PATHOGEN_PACKAGE_NAME
	git pull
else

	echo "Cloning PATHOGEN_PACKAGE_NAME"
	git clone --depth=1 git://github.com/YOUR_GITHUB_USERNAME/PATHOGEN_PACKAGE_NAME.git

fi

cd $return_dir

ret=$?
if [ $ret -ne 0 ]; then
	echo && echo "PATHOGEN_PACKAGE_NAME failed to update." >&2
else
	 echo && echo "PATHOGEN_PACKAGE_NAME was updated."
fi

exit $ret
