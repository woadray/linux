#!/bin/bash

# RPM FUSION
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# BASE
dnf --setopt=install_weak_deps=False --best install -y i3 \
                                                       i3status \
                                                       dmenu \
                                                       @base-x \
                                                       @fonts
                                                       
dnf --setopt=install_weak_deps=False --best install -y NetworkManager \
                                                       NetworkManager-wifi \
                                                       iwl7260-firmware \
                                                       power-profiles-daemon \
                                                       acpi \
                                                       xrandr \
                                                       pipewire \
                                                       pipewire-pulseaudio \
                                                       pulseaudio-utils \
                                                       pavucontrol \
                                                       compton \
                                                       xbacklight \
                                                       redshift \
                                                       rofi \
                                                       feh
                                                       
dnf --setopt=install_weak_deps=False --best install -y kitty \
                                                       neovim \
                                                       fish \
                                                       ranger \
                                                       unzip \
                                                       unrar \
                                                       wget \
                                                       curl \
                                                       aria2 \
                                                       yt-dlp \
                                                       yt-dlp-fish-completion \
                                                       ffmpeg \
                                                       xclip \
                                                       openssl \
                                                       fzf \
                                                       fd-find \
                                                       bat \
                                                       mupdf \
                                                       mpv \
                                                       transmission
                                                       
# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# RICE
dnf --setopt=install_weak_deps=False --best install -y lxappearance \
                                                       arc-theme \
                                                       papirus-icon-theme \
                                                       breeze-cursor-theme

# SETUP
dnf --setopt=install_weak_deps=False --best install -y python3-pip \
                                                       gcc \
                                                       gcc-c++ \
                                                       gdb \
                                                       valgrind \
                                                       java-11-openjdk-devel \
                                                       nodejs \
                                                       npm

# MISC
# xorg.conf
cd /etc/X11
echo "Section \"Device\"
        Identifier  \"Intel Graphics\"
        Driver      \"intel\"
        Option      \"Backlight\" \"intel_backlight\"
EndSection" >> xorg.conf
cd

# .xinitrc
echo "#!/bin/sh              

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x \"\$f\" ] && . \"\$f\"
  done
  unset f
fi

exec i3" >> /home/ralinoro/.xinitrc

# .bashrc
echo "
if [[ ! \$DISPLAY && \$XDG_VTNR -eq 1 ]]; then
  exec startx
fi" >> /home/ralinoro/.bashrc

# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
