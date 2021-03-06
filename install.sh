#! /bin/bash

sudo apt update &&
sudo apt upgrade &&

# list of software to be installed
declare -a iaptWare=(
	#"texlive" too big for /var/cache. Install via aptitude
	"acpi"
	"aptitude"
	"arandr"
	"audacity"
	"cabal-install"
	"cmus"
	"compton"
	"dmz-cursor-theme"
	"feh"
	"firefox-esr"
	"firefox-locale-en"
	"firefox-locale-eo"
	"fonts-3270"
	"gimp"
	"git"
	"htop"
	"jupyter-notebook"
	"libghc-xmonad-contrib-dev"
	"okular"
	"pandoc"
	"pulseaudio"
	"pylint"
	"pylint3"
	"python3-matplotlib"
	"python3-numpy"
	"python3-pip"
	"ranger"
	"rofi"
	"scrot"
	"spyder3"
	"steam-launcher"
	"transmission-gtk"
	"tree"
	"tty-clock"
	"vim"
	"vlc"
	"wine"
	"wpagui"
	"wpasupplicant"
	"xdotool"
	"xmobar"
	"xmonad"
	"xorg"
	"xterm"
	)

# loop running the apt installer
for i in "${aptWare[@]}"
do
	yes | sudo apt install "$i"
done

#directories and files to be made
#mkdir ~/.wallpapers &&
#mkdir -p ~/.xmonad/lib/XMonad/Layout &&
#mkdir -p ~/.vim/bundle &&
#touch ~/.xmonad/xmonad.errors &&

#list of repos to be cloned
#git clone https://github.com/superdamo/dotfiles &&
#wget https://raw.githubusercontent.com/egasimus/xmonad-equalspacing/master/EqualSpacing.hs -P ~/.xmonad/lib/XMonad/Layout/ &&
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
#sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/ProggyClean/Regular/complete/ProggyCleanTT\ Nerd\ Font\ Complete.ttf -O  /usr/share/fonts/truetype/ProggyClean.ttf &&

#move files to final location
#mv ~/dotfiles/.bashrc ~/.bashrc &&
#mv ~/dotfiles/.brightness ~/.brightness &&
#mv ~/dotfiles/.fehbg ~/.fehbg &&
#mv ~/dotfiles/.getvolume.sh ~/.getvolume.sh &&
#mv ~/dotfiles/.startpage.html ~/.startpage.html &&
#mv ~/dotfiles/.startpage_image ~/.startpage_image &&
#mv ~/dotfiles/.vimrc ~/.vimrc &&
#mv ~/dotfiles/.xinitrc ~/.xinitrc &&
#mv ~/dotfiles/.xmobarrc ~/.xmobarrc &&
#mv ~/dotfiles/.Xresources ~/.Xresources &&
#mv ~/dotfiles/cmus_info.sh ~/.cmus_info.sh &&
#mv ~/dotfiles/userChrome.css ~/userChrome.css &&
#mv ~/dotfiles/GB.JPG ~/.wallpapers/GB.jpg &&
#mv ~/dotfiles/xmonad-x86_64-linux ~/.xmonad/ &&
#mv ~/dotfiles/xmonad.hi ~/.xmonad/ &&
#mv ~/dotfiles/xmonad.hs ~/.xmonad/ &&
#mv ~/dotfiles/xmonad.o ~/.xmonad/ &&

# clean up, recompile of wm and resources merge
rm -rf ~/dotfiles &&
sudo rm -rf /usr/share/fonts/truetype/dejavu &&
xmonad --recompile &&
xrdb -load ~/.Xresources &&
echo "2" | sudo update-alternatives --config x-cursor-theme &&

# starting the X server with cheesy countdown & clean up
sleep 5 &&
echo "Starting system in:" &&
echo "5..." &&
sleep 1; echo "4..." &&
sleep 1; echo "3..." &&
sleep 1; echo "2..." &&
sleep 1; echo "1..." &&
sleep 1; startx & rm ~/install.sh
