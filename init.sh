sudo pacman -Syu
sudo pacman -S dkms chromium linux54-headers termite

mkdir -p freespace
mkdir -p freespace/third_party
cd ~/freespace/third_party

# rtl driver installation
git clone https://github.com/smlinux/rtl8723de.git -b current 
dkms add ./rtl8723de
dkms install rtl8723de/5.1.1.8_21285.20171026_COEX20170111-1414
depmod -a
reboot

# install configurations
git clone https://github.com/Justarone/configs.git ~/freespace/configs
sudo cp ~/freespace/configs/i3_config ~/.i3/config
sudo cp vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman -S nodejs yarn
mkdir -p ~/.config/termite
sudo cp ~/freespace/configs/termite_config ~/.configs/termite/config
git clone https://github.com/davatorium/rofi-themes.git ~/freespace/third_party/rofi_themes
~/freespace/third_party/rofi_themes/install.sh
# set onedark theme via rofi-theme-selector
# edit .profile - set browser and write:
# export TERMINAL=/usr/bin/termite

sudo pacman -S zsh
#install ohmyzsh via curl:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/freespace/third_party/powerlevel10k
echo "source ~/freespace/third_party/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

# pip3 install jedi # for coc.nvim python but it's better to do next line:
# update coc-settings.json to use mpls

sudo pacman -S bash-language-server

# hdd routine
# sudo lsblk  -  check disks list
# (format disk in gparted or use: `sudo mkfs.ext4 /dev/sda`)
# sudo mkdir /home/justarone/hdd
# sudo mount /dev/sda /home/justarone/hdd  -  one time mount (lost on reboot)
# sudo blkid  -  find uuid of the disk
# add to /etc/fstab:
# UUID=8c056b07-58a0-4488-b809-8feb2a6c8c94 /home/justarone/hdd ext4 defaults,noatime,discard 0 2 (it's example)


# external monitor
# arandr - program to configure setup for more than 1 monitor
# save layout - generates .sh script which will use right configuration of xrandr
