# Groups and users
if [ -z $(groups | grep -Eo "video") ]; then
    usermod -a -G video ${SUDO_USER}
    echo "Added ${SUDO_USER} to the 'video' group to control brightness"
fi
