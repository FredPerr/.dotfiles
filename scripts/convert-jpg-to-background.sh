if [ -e $1 ]; then
    convert $1 -resize 1920x1080 "${1%.*}.png" 
else
    echo "The provided file does not exist"
    exit 1
fi

