# Dotfiles

This repo uses [rotz] to bootstrap and manage the configuration files
(dotfiles).

## Setup

Currently [rotz] requires [git] to be installed as a pre-requisite.

1. Download the [latest release] for your platform.
   - [Windows](https://github.com/volllly/rotz/releases/latest/download/rotz-x86_64-pc-windows-msvc.zip)
   - [MacOS Intel](https://github.com/volllly/rotz/releases/latest/download/rotz-x86_64-apple-darwin.zip)
   - [Linux](https://github.com/volllly/rotz/releases/download/v0.9.3/rotz-x86_64-unknown-linux-gnu.zip)
2. Unpack `rotz.exe`. Optionally place this in a location on your PATH.
3. Run `rotz clone git@github.com:pho3nixf1re/dotfiles.git`

## Usage

To link dotfiles:

```zsh
rotz link
```
To install dependencies:

```zsh
rotz install
```

To update dotfiles:

```zsh
rotz sync
```

## Shell dependencies

These should be setup to install using `rotz install`.

- [zshell](https://www.zsh.org/): `brew install zsh`
  - on linux it may be best to use native package then run `chsh -s /path/to/zsh`
- [homebrew](https://docs.brew.sh/) which is also [available on linux](https://docs.brew.sh/Homebrew-on-Linux):
```zsh
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  ```
- [starship](https://starship.rs): `brew install starship`
- [nvim](https://neovim.io): `brew install neovim`
- [spacevim](https://spacevim.org): `curl -sLf https://spacevim.org/install.sh | bash`

## Git commit signing

1. Install 1password.
2. Copy GitHub ssh fingerprint from 1password.
3. Add to user settings in `.gitconfig-local` which is not checked in here.
   ```gitconfig
   [user]
   signingkey = ssh-ed25519 AAAA...
   ```

## Environment secrets

Place environment secrets into the local user files (`.zprofile` or
`Microsoft.PowerShell_profile.ps1`). These will not live here except to be
documented if needed during shell initialization.

[rotz]: https://volllly.github.io/rotz
[1password]: https://1password.com
[git]: https://git-scm.com
