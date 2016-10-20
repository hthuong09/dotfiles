if [[ -d "$HOME/bin" ]] ; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.config/composer/vendor/bin" ]]; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# Go language
if which go &>/dev/null; then
    export GOPATH=~/go
    export PATH=$PATH:~/go/bin
fi

# Google Chrome
if which google-chrome-stable &>/dev/null; then
    export CHROME_BIN=/usr/bin/google-chrome-stable
fi

# Android Studio
if [[ -d "/opt/android-sdk" ]]; then
    export ANDROID_HOME=/opt/android-sdk
fi

# Editor
if which nvim &>/dev/null; then
    alias vim=nvim
    export EDITOR="vim"
else
    export EDITOR="nano"
fi
