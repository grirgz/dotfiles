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
mkdir ~/.unison/
ln -s ~/dotfiles/samples.prf ~/.unison/ # note: root is /home/ggz, should be changed or symlinked if different profile name

ln -s ~/dotfiles/.NERDTreeBookmarks ~/

### create all repo

cd ~
mr checkout

### sync local repo
git clone ssh://ggz@ggzor.local:2200/home/ggz/Notebooks/Notes

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

# plugins

# 3.7.1
#since downloading the tarball miss the nova submodule, i clone the git repo then checkout the Version-3.7.1 tag

git clone https://github.com/supercollider/sc3-plugins
git submodule update --init # nove submodule
git tag -l # to list tags
git checkout Version-3.9.1

# note: Tscramble UGen come from wslib quark

### SCVim
# since 3.9, SCVim is separated
# not in mr yet to not pollute older sc versions
git clone https://github.com/supercollider/scvim.git ~/.vim/bundle/scvim


#### samples

mkdir -p ~/Musique/sc/samplekit
unison samples

#### quarks

ddwCommon # asPattern used by streamPlayer of Param quark
wslib # isSymbolWS, Tscramble UGen
cruciallib # StaticIntegerSpec in v15 (why i use this, no reason!)
Feedback # Fb in rise13
Modality

# used by Param
Log
jitlibextensions # Halo getSpec

