## Shell dependencies

- [zshell](https://www.zsh.org/): `brew install zsh`
  - on linux it may be best to use native package then run `chsh -s /path/to/zsh`
- [homebrew](https://docs.brew.sh/) which is also [available on linux](https://docs.brew.sh/Homebrew-on-Linux):

  ```zsh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- [starship](https://starship.rs/): `brew install starship`
- [nvim](https://neovim.io/): `brew install neovim`

## Environment secrets

Place environment secrets into the local user `.zprofile` file. These will not
live here except to be documented if needed during shell initialization.
