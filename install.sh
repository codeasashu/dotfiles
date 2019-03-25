#!/bin/bash

SECRETS=(ssh aws config/mopidy)
RCLONE_REMOTE_DIR="dotfiles"

command_exists() {
	type "$1" > /dev/null 2>&1
}

confirm_user() {
    read -p "Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting..."
        exit 0;
    fi;
}

connect_mega() {
    DESTN="$1"
    confirm_user
    echo "\nGenerating Mega config...\n"
    read -p 'Enter mega emailid:' mega_email
    read -sp 'Enter mega password:' mega_pass
    echo "\nPlease wait while I download secret files...."
    rclone config create mega mega user $mega_email
    rclone config password mega pass $mega_pass
    for folder in ${SECRETS[@]}; do
        if [ ! -d "$DESTN/$folder" ]; then
            mkdir -p "$DESTN/$folder"
        fi;
        rclone copy mega:/$RCLONE_REMOTE_DIR/$folder $DESTN/$folder
    done;
}

## Install ranger autocompletion plugins
install_ranger_devicons(){ 
    git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.dotfiles/ranger_devicons
    cd $HOME/.dotfiles/ranger_devicons
    make install
    cd $HOME/.dotfiles
}

cleanup() {
    #cd into dotfiles if we aren't already
    cd $HOME/.dotfiles
    rm -rf yay ranger_devicons
}

DEV_PKG="git rsync neovim zsh zsh-completions termite fasd fzf ctags cmake docker docker-compose the_silver_searcher python2 python2-pip python-pip openssh httpie jq tig autojump"
DISP_PKG="xorg-server xorg-xinit xorg-xprop xorg-xrandr xsel feh w3m scrot"
EXTRA_PKG="ntp jsoncpp tldr wmctrl wget tree zip unzip rclone diff-so-fancy bat lolcat udiskie android-file-transfer android-udev"
FONTS_PKG="noto-fonts ttf-hack"
MUSIC_PKG="alsa-utils pavucontrol-qt pulseaudio ncmpcpp youtube-viewer mpv"
I3_PKG="i3-gaps compton neofetch dunst rofi ranger python-pywal"
PACKAGES="$DISP_PKG $I3_PKG $DEV_PKG $EXTRA_PKG $MUSIC_PKG $FONTS_PKG"

# Install a display manager first
sudo pacman -S $PACKAGES

# Install yay
if ! command_exists yay; then
git clone https://aur.archlinux.org/yay.git yay
cd yay
makepkg -si
fi;

# Install a dotfile manager
if ! command_exists rcup; then
yay -S rcm
fi;

#Configure neovim. Install vimplug
if [ ! -f ~/.config/nvim/site/autoload/plug.vim ]; then
	curl -fLo ~/.config/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi;

if ! command_exists polybar; then
  yay -S polybar i3lock-fancy-git
fi;

if ! command_exists google-chrome-stable; then
  yay -S google-chrome
fi;

if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi;

# Install nerd font complete
if [ ! -d $HOME/.cache/yay/nerd-fonts-complete ]; then
yay -S nerd-fonts-complete
fi;

if ! command_exists fzf; then
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    exec $HOME/.fzf/intall
fi;

# Install mopidy-git (support for python 3x)
if ! command_exists mopidy; then
    yay -S mopidy-mpris
fi;

#Install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k

# Install pip addons
sudo pip install google-api-python-client oauth2client neovim awscli

# Install mopidy addons (Python 2 support)
sudo pip2 install mopidy-gmusic Mopidy-YouTube youtube-dl

#Install vimplug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# configure diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global core.excludesfile $HOME/.gitignore

# clone the git repo for dotfiles
cd $HOME/.dotfiles

#nvim fixes
mkdir $HOME/.config/nvim/backup
mkdir $HOME/.config/nvim/swap

# Clone all secret deps
connect_mega "$HOME/.dotfiles"

#Symlink magic
rcup -v

# Post Setup
## Fix SSH Perms
sudo chmod 400 $HOME/.ssh/id_rsa
sudo chmod 400 $HOME/.ssh/*.pem

## Fix docker group perm
sudo usermod -aG docker $USER

## Cleanup everything
cleanup
