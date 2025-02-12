# 🏡 Home Config

Opinionated (my own) home configuration.

## High-level Highlights

### Tools

- [Nix](https://nixos.org/) + [Home Manager](https://nix-community.github.io/home-manager/)
- [neovim](https://neovim.io/) + [Lua](https://www.lua.org/)
- [starship](https://starship.rs/)
- [tmux](https://github.com/tmux/tmux/wiki)
- [zsh](https://www.zsh.org/)

### Commands

- `reload`: reload shell
- `reno`: update home

## Getting Started

### MacOS

1. Install [Homebrew](https://brew.sh/):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install & Setup [nix](https://nixos.org/download.html):

```bash
sh <(curl -L https://nixos.org/nix/install)
mkdir -p ~/.config/nix

cat <<EOF >> ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF

sudo launchctl kickstart -k system/org.nixos.nix-daemon
```

3. Setup env:

- First, generate an SSH key and add it to your GitHub account:

```bash
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub | pbcopy
```

- Then, clone and symlink the .dotfiles repo:

```bash
mkdir -p ~/.config
mkdir ~/Projects
cd ~/Projects
git clone git@github.com:simplystuart/.dotfiles.git
ln -s ~/Projects/.dotfiles ~/.config/home-manager
```

- Finally, pull down large files via Git LFS:

```bash
cd ~/Projects/.dotfiles
brew install git-lfs
git lfs install --local
git lfs pull
```

4. Setup home-manager:

```bash
cd ~/.config/home-manager
nix run . switch
```

5. Install rosetta:

```bash
softwareupdate --install-rosetta
```

## Inpsirations

- [0 to LSP : Neovim RC From Scratch](https://youtu.be/w7i4amO_zaE?feature=shared)
- [Tidying up your $HOME with Nix](https://juliu.is/tidying-your-home-with-nix/)
