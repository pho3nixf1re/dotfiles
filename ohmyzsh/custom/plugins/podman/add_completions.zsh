function _add_completions {
  command=$1

  # If the completion file doesn't exist yet, we need to autoload it and
  # bind it to `docker`. Otherwise, compinit will have already done that.
  if [[ ! -f "$ZSH_CACHE_DIR/completions/_$command" ]]; then
    typeset -g -A _comps
    autoload -Uz _$command
    _comps[$command]=_$command
  fi

  command $command completion zsh >| "$ZSH_CACHE_DIR/completions/_$command"
}
