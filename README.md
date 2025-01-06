# 🏡 Home Config

Opinionated (my own) home configuration.

## Install

```bash
curl -L https://nixos.org/nix/install | sh

mkdir -p ~/.config/nix

cat <<EOF >> ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF

sudo launchctl kickstart -k system/org.nixos.nix-daemon

ln -s ~/Projects/.dotfiles ~/.config/home-manager

nix run . switch
```

## High-level Highlights

- [Nix](https://nixos.org/) + [Home Manager](https://nix-community.github.io/home-manager/)
- [neovim](https://neovim.io/) + [Lua](https://www.lua.org/)
- [starship](https://starship.rs/)
- [tmux](https://github.com/tmux/tmux/wiki)
- [zsh](https://www.zsh.org/)

## Inpsirations

- [0 to LSP : Neovim RC From Scratch](https://youtu.be/w7i4amO_zaE?feature=shared)
- [Tidying up your $HOME with Nix](https://juliu.is/tidying-your-home-with-nix/)
