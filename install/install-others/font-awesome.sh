mkdir -p ~/.dotfiles/.tmp
mkdir ~/.local/share/fonts

wget https://use.fontawesome.com/releases/v6.4.2/fontawesome-free-6.4.2-web.zip -P ~/.dotfiles/.tmp/

unzip ~/.dotfiles/.tmp/fontawesome-free-6.4.2-web.zip -d ~/.dotfiles/.tmp/fontawesome/ &> /dev/null

mv ~/.dotfiles/.tmp/fontawesome/* ~/.local/share/fonts/

rm -rdf ~/.dotfiles/.tmp

echo "Successfully installed FontAwesome OTF files."
