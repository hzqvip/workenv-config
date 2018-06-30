#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e
sudo spctl --master-disable
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

ln -s $DIR/.vimrc ~/

# add two source persion post_zshrc
sed -i 's#source $ZSH/oh-my-zsh.sh#source '$DIR'/.pre_zshrc \
source $ZSH/oh-my-zsh.sh \
source '$DIR'/.post_zshrc#g' ~/.zshrc

chsh -s /bin/zsh