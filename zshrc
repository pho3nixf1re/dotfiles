# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  _linux="true"

  if [[ `uname -a` == *"WSL"* ]]; then
    _wsl="true"
  fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
  _macos="true"

elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
  _cywin="true"

elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  _mingw="true"

elif [[ "$OSTYPE" == "win32" ]]; then
  _impossible="true"

elif [[ "$OSTYPE" == "freebsd"* ]]; then
  _freebsd="true"

fi

### THEME (disabled, handled by starship.rs)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="gnzh-custom"

### THEME

if [[ "$_macos" == "true" ]]; then
  ZSH_TMUX_ITERM2="true"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
transfer asdf brew \
gpg-agent \
vi-mode tmux autojump \
encode64 extract urltools \
git git-extras gitignore git-escape-magic \
docker docker-compose \
node npm yarn \
python pip
)

if [[ "$_macos" == "true" ]]; then
  plugins+=(macos adb)
fi

if [[ "$_linux" == "true" ]]; then
  # plugins+=(brew)
fi

### ZSH configuration
setopt dotglob

# Allow comments in interactive mode, useful for tmux automation
setopt interactivecomments

# Disable autocorrect
unsetopt correct_all

### Initiallize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Add user bin to PATH
if [ -d "$HOME/bin" ]; then
  export PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

# Starship prompt initialization
eval "$(starship init zsh)"

# Replace vim with nvim 😎
export EDITOR=nvim
alias vim='nvim'

# Allow GNUPGP to pop a dialog for passphrase
export GPG_TTY=`tty`

# less ascii colors
alias less='less -r'

# npm aliases
alias nr='npm run'
alias ni='npm install'

# git aliases
alias gcfr='git commit --fixup @ && git rebase -i @~2'
alias ghpr='gh pr create -f'

if [[ "$_macos" == "true" ]]; then
  # Fix pyenv to use openssl from homebrew
  alias pyenv='CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv'

  # ITerm2 shell integration.
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

  # Add sbin to PATH
  export PATH="$PATH:/usr/local/sbin"

  # Add Android Studio platform-tools to PATH
  if [ -d "$HOME/Library/Android/sdk/platform-tools" ]; then
    export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
  fi

  # File watchers need a higher limit or they fail on large projects
  ulimit -n 10240
fi

### git configuration selection
if [[ "$_macos" == "true" ]]; then
 export GIT_CONFIG=~/.gitconfig-macos
fi

if [[ "$_linux" == "true" ]]; then
 export GIT_CONFIG=~/.gitconfig-linux
fi
###

### SpaceVim python support
if command -v python3 &>/dev/null; then
  export PYTHON3_HOST_PROG=$(which python3)
fi

if command -v python &>/dev/null; then
  export PYTHON_HOST_PROG=$(which python)
fi
### END SpaceVim python support

# TODO: update these
# Wake on LAN aliases
# alias wake-mturney-desktop='wakeonlan 04:92:26:6d:ae:1c'
# alias wake-bjturney-desktop='wakeonlan 00:d8:61:ab:4e:1c'

### Cvent
alias copy-migrated-properties="aws s3api list-objects-v2 --bucket core-socialtables-prod-st-visualizer-properties-us-east-1 --profile core-socialtables-prod --prefix 4.27.2- | jq '.Contents[].Key' | sed -E 's/\"4\.27\.2-([0-9]+)_.*\"/\1/g' | uniq | pbcopy"

### END Cvent
