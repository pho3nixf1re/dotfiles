if (Get-Command python3 -ErrorAction SilentlyContinue) {
  $env:PYTHON3_HOST_PROG = (Get-Command python3).Source
}
elseif (Get-Command python -ErrorAction SilentlyContinue) {
  $env:PYTHON_HOST_PROG = (Get-Command python).Source
}
