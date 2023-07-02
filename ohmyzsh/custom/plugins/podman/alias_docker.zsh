function _alias_docker {
  if ! command -v docker &> /dev/null; then
    if command -v podman &> /dev/null; then
      alias docker=podman
    fi
  fi

  if ! command -v docker-compose &> /dev/null; then
    if command -v podman-compose &> /dev/null; then
      alias docker-compose=podman-compose
    fi
  fi
}
