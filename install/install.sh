#!/bin/bash


if  [ ! "$EUID" -eq 0 ]; then
    echo "You have to run this script with sudo!"
    exit 1
fi

HOME="/home/${SUDO_USER}"
DOTFILES="${HOME}/.dotfiles"
LOCAL_APPS="${HOME}/apps"


mkdir -p "${HOME}/apps"


if [ ! -f "${DOTFILES}/install/pkg-list" ]; then
    echo "${DOTFILES}/install/pkg-list file does not exist."
    exit 1
fi

if [ ! -f "${DOTFILES}/install/repo-list" ]; then
    echo "${DOTFILES}/install/repo-list file does not exist."
    exit 1
fi

while read -r line; 
    do sudo add-apt-repository -y "$line"; 
done < "${DOTFILES}/install/repo-list"

# Once all the repositories are added, install the packages:
xargs -a "${DOTFILES}/install/pkg-list" sudo apt-get install -y


# Install the packages that are not available in repositories
INSTALL_OTHERS="${DOTFILES}/install/install-others"
if [ -d "${INSTALL_OTHERS}" ]; then
    for sh_file in "${INSTALL_OTHERS}"/*; do
        if [ "${sh_file: -3}" == ".sh" ]; then
            echo "Starting '${sh_file}' script.."
            bash $sh_file
        fi
    done
else
    echo "Could not find the ${INSTALL_OTHERS} directory."
fi



#
# Chmod scripts
#
SCRIPTS="${DOTFILES}/scripts"
SCRIPTS_EVENTS="${DOTFILES}/scripts/events"
if [ -d "${SCRIPTS}" ]; then
    for sh_file in "${SCRIPTS}"/*; do
        if [ "${sh_file: -3}" == ".sh" ]; then
            chmod +x $sh_file
            echo "Gave running permission to $sh_file."
        fi
    done
else
    echo "Could not find the ${SCRIPTS} directory."
fi

if [ -d "${SCRIPTS_EVENTS}" ]; then
    for sh_file in "${SCRIPTS_EVENTS}"/*; do
        if [ "${sh_file: -3}" == ".sh" ]; then
            chmod +x $sh_file
            echo "Gave running permission to $sh_file."
        fi
    done
else
    echo "Could not find the ${SCRIPTS_EVENTS} directory."
fi


sudo -u $SUDO_USER chsh -s $(which zsh)


# Setup the symlinks
bash $DOTFILES/install/setup-symlinks.sh
#sudo cp $DOTFILES/config/startup.service /etc/systemd/system/startup.service
#sudo systemctl enable startup.service
