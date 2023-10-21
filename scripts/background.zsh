#!/bin/zsh


if [ ! pgrep -x "i3" &> /dev/null ]; then
    echo "You can't lock this session while using another window manager than i3"
    exit 1
fi

backgrounds_dir="/home/$USER/.dotfiles/assets/backgrounds"
png_files=(${backgrounds_dir}/*.png)

# Check if there are any PNG files
if [[ -e $png_files[1] ]]; then
  # Generate a random index within the array
  random_index=$(( $RANDOM % $#png_files + 1 ))
  # Set the chosen file as the BACKGROUND variable
  BACKGROUND=$png_files[$random_index]
fi
# Random file selection (between png files in .dotfiles/assets/backgrounds/)

# Uncomment this line to use same default background image every time 
#BACKGROUND="${1:-"$DOTFILES/optical-fiber.jpg"}"


if [ -e "$BACKGROUND" ]; then
    feh --bg-fill ${BACKGROUND%.*}.png;
else
    echo "Could not find any background in $bcakgrounds_dir"
fi
