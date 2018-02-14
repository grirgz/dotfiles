#!/bin/sh

### Bootstrap
#git clone https://github.com/grirgz/dotfiles.git

# to exec selection  :'<,'>w !sh

#### packages

sh ~/dotfiles/system_init.sh

#### dotfiles

ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.bash_aliases ~/
ln -s ~/dotfiles/.mrconfig ~/

mkdir ~/.config/SuperCollider
ln -s ~/dotfiles/startup.scd ~/.config/SuperCollider/startup.scd

mkdir ~/bin
ln -s ~/dotfiles/seco ~/bin
ln -s ~/dotfiles/sound ~/bin
ln -s ~/dotfiles/nosound ~/bin
ln -s ~/dotfiles/update_repos ~/bin
mkdir ~/.unison/
ln -s ~/dotfiles/samples.prf ~/.unison/ # note: root is /home/ggz, should be changed or symlinked if different profile name

### create all repo

cd ~
mr update

### Build SC

#download sc
mkdir ~/build
mv ~/Téléchargements/SuperCollider* ~/build
tar xf SuperCollider* 
mkdir ~/build/SuperCollider-Source/build
cd  ~/build/SuperCollider-Source/build
ccmake ..
# set BUILDTYPE=RELEASE
# set NATIVE=ON
# set SC_EL=OFF
make -j 4
sudo make install

# since 3.9, SCVim is separated in ~/.vim/scvim repo


#### samples

mkdir -p ~/Musique/sc/samplekit
unison samples

#### quarks

wslib # isSymbolWS
jitlibextensions # Halo getSpec
cruciallib # StaticIntegerSpec in v15 (why i use this, no reason!)
Feedback # Fb in rise13
