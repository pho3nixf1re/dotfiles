#!/bin/zsh

ONEPASSWORD_DIR=~/.1password
AGENT_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

if [[ ! -d $ONEPASSWORD_DIR ]]; then
  mkdir -p $ONEPASSWORD_DIR
fi

if [[ -S $AGENT_SOCK ]]; then
  if [[ ! -L $ONEPASSWORD_DIR/agent.sock ]]; then
    ln -s $AGENT_SOCK $ONEPASSWORD_DIR/agent.sock
  fi

  export SSH_AUTH_SOCK=$ONEPASSWORD_DIR/agent.sock
else
  echo "1Password agent socket not found. Skipping setup."
fi
