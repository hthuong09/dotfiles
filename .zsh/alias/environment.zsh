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
    alias vim=nvim
    export EDITOR="vim"
else
    export EDITOR="nano"
fi

# npm global without root
if hash npm 2>/dev/null; then
    if [ ! -d "$HOME/.npm-global" ]; then
        mkdir ~/.npm-global
    fi

    NPM_CONFIG_PREFIX=~/.npm-global
    export PATH=~/.npm-global/bin:$PATH
fi

# Yarn package manager
if hash yarn 2>/dev/null; then
    export PATH=~/.yarn/bin:$PATH
fi

