if command -v python3 &>/dev/null; then
  export PYTHON3_HOST_PROG=$(which python3)
elif command -v python &>/dev/null; then
  export PYTHON_HOST_PROG=$(which python)
fi
