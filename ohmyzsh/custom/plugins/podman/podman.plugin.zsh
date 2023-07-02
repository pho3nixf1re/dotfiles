# Standarized $0 handling
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

COMMAND_NAME=podman # docker

# Early exit if there is no command
if (( ! $+commands[$COMMAND_NAME] )); then
  return
fi

PLUGIN_DIR=${0:h}
. "$PLUGIN_DIR/create_shortcut_aliases.zsh"
. "$PLUGIN_DIR/alias_docker.zsh"
. "$PLUGIN_DIR/add_completions.zsh"

_create_shortcut_aliases $COMMAND_NAME
_alias_docker
_add_completions $COMMAND_NAME
