if [[ -d "$HOME/.config/composer/vendor/bin" ]]; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# Go language
if hash go 2>/dev/null; then
    export GOPATH=~/go
    export PATH=$PATH:~/go/bin
fi

# Google Chrome
if hash google-chrome-stable 2>/dev/null; then
    export CHROME_BIN=/usr/bin/google-chrome-stable
fi

# Android Studio
if [[ -d "/opt/android-sdk" ]]; then
    export ANDROID_HOME=/opt/android-sdk
fi

# Editor
if hash nvim 2>/dev/null; then
    export EDITOR="vim"
else
    export EDITOR="nano"
fi

NODE_PACKAGES_PATH=~/.node-packages

node_packages_preparing() {
  NODE_PACKAGES_PATH=$1
  NODE_PACKAGES_BIN_PATH=$1/bin

  if [ ! -d $NODE_PACKAGES_PATH ]; then
      mkdir $NODE_PACKAGES_PATH
  fi

  if [[ $PATH != *"$NODE_PACKAGES_BIN_PATH"* ]]; then
    export PATH=$NODE_PACKAGES_BIN_PATH:$PATH
  fi

}

# npm global without root
if hash npm 2>/dev/null; then
    node_packages_preparing $NODE_PACKAGES_PATH

    export NPM_CONFIG_PREFIX=$NODE_PACKAGES_PATH
fi

# Yarn package manager
if hash yarn 2>/dev/null; then
  node_packages_preparing $NODE_PACKAGES_PATH

  if [[ $(yarn config get prefix) != $NODE_PACKAGES_PATH ]]; then
    yarn config set prefix $NODE_PACKAGES_PATH > /dev/null
  fi
fi

