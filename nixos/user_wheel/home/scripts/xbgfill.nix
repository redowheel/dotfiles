{ pkgs }: pkgs.writeShellScriptBin "xbgfill" ''
	BG_IMG_PATH="$HOME/.background-image"

	if [ "$#" != 1 ]; then
   		echo "Usage: Give path of image that should setted as wallpaper."
   		exit -2
	fi

	if [ ! -f "$1" ]; then
    	echo "Give an existing path!"
		exit -2
	fi

	if ! file $1 | grep -q 'image'; then
		echo "File is not an image!"
		exit -1
	fi

	BG_IMG_TO_SET=$(realpath $1)

	echo "Are you sure? [ Yes/No ]"
	select choice in Yes No; do
    	case $choice in
			Yes ) rm -rf $BG_IMG_PATH && ln -s $BG_IMG_TO_SET $BG_IMG_PATH && feh --bg-scale $BG_IMG_PATH; break;;
			No ) echo "Operation canceled." && exit;;
    	esac
	done
''
