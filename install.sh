#!/bin/sh
if ! [ -x "$(command -v zsh)" ]; then
  echo Missing zsh command, installing it...
  if [[ $OSTYPE == 'darwin'* ]]; then
    brew install zsh
    chsh -s /usr/local/bin/zsh
  else
    apt install zsh
  fi
else
  echo Zsh found in version $(zsh --version)
fi

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k/ ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  cp -f .p10k.zsh ~
fi

if ! [ -x "$(command -v nvm)" ]; then
  echo Missing nvm command, installing it...
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
else
  echo NVM found in version $(nvm --version)
fi

export ZSH_CONFIG_DIR="$(pwd)"
