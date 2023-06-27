## Shell dependencies

- [zshell](https://www.zsh.org/): `brew install zsh`
  - on linux it may be best to use native package then run `chsh -s /path/to/zsh`
- [homebrew](https://docs.brew.sh/) which is also [available on linux](https://docs.brew.sh/Homebrew-on-Linux):
```zsh
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  ```
- [starship](https://starship.rs): `brew install starship`
- [nvim](https://neovim.io): `brew install neovim`
- [spacevim](https://spacevim.org): `curl -sLf https://spacevim.org/install.sh | bash`

## Git configuration dependencies

- [delta](https://dandavison.github.io/delta)
  - windows: `winget install dandavison.delta`
  - linux/macos: `brew install git-delta`

## Git commit signing

1. Install 1password.
2. Copy GitHub ssh fingerprint from 1password.
3. Add to user settings in `.gitconfig-local` which is not checked in here.
   ```gitconfig
   [user]
   signingkey = ssh-ed25519 AAAA...
   ```

## Environment secrets

Place environment secrets into the local user `.zprofile` file. These will not
live here except to be documented if needed during shell initialization.
