#!/bin/bash

# RPM FUSION
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Base
dnf --setopt=install_weak_deps=False --best install -y @base-x \
						       @fonts \
						       iwl7260-firmware \
						       gnome-shell \
						       gdm \
						       f36-backgrounds-gnome \
                                                       NetworkManager \
                                                       NetworkManager-wifi \
                                                       NetworkManager-bluetooth \
                                                       power-profiles-daemon
# Apps
dnf --setopt=install_weak_deps=False --best install -y kitty \
                                                       nautilus \
                                                       mpv \
                                                       ffmpeg \
                                                       eog \
                                                       neovim \
                                                       fish \
                                                       unzip \
                                                       unrar \
                                                       wget \
                                                       curl \
                                                       aria2 \
                                                       yt-dlp \
						       yt-dlp-fish-completion \
						       fzf \
						       openssl \
						       gnome-tweaks \
						       gnome-extensions-app \
						       gnome-browser-connector \
						       papirus-icon-theme \
						       breeze-cursor-theme

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# adw-gtk3
wget https://github.com/lassekongo83/adw-gtk3/releases/download/v4.3/adw-gtk3v4-3.tar.xz

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# Swap Bash for Fish
dnf check-update
dnf upgrade
chsh -s $(which fish)

# Removing some packages
dnf remove -y nano vim-minimal

# Reboot
systemctl set-default graphical.target
reboot

# ?
# dnf --setopt=install_weak_deps=False --best install -y evince evince-djvu evince-thumbnailer
