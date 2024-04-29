{ pkgs, ... }: {
  home = {
    homeDirectory = "/Users/stuartdum";
    stateVersion = "22.11";
    username = "stuartdum";
  };

  home.file.".config/nvim" = {
    recursive = true;
    source = ./nvim;
    target = ".config/nvim";
  };

  home.file.".config/starship.toml" = {
    source = ./starship.toml;
    target = ".config/starship.toml";
  };

  home.packages = [
    pkgs.bat
    pkgs.coreutils
    pkgs.curl
    pkgs.deno
    pkgs.exiftool
    pkgs.ffmpeg
    pkgs.findutils
    pkgs.gh
    pkgs.gnugrep
    pkgs.gnused
    pkgs.htop
    pkgs.imagemagick
    pkgs.jpegoptim
    pkgs.jq
    pkgs.lazygit
    pkgs.nerdfonts
    pkgs.nix-zsh-completions
    pkgs.nodejs
    pkgs.ripgrep
    pkgs.scc
    pkgs.ssh-copy-id
    pkgs.tree
    pkgs.watch
    pkgs.wget
    pkgs.youtube-dl
    pkgs.zsh-autocomplete
  ];

  programs = {
   # home manager
    home-manager.enable = true;

    # all the rest
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    eza.enable = true;
    fzf.enable = true;

    git = {
      aliases = {
        ci = "commit";
        co = "checkout";
        di = "diff";
        sh = "show";
        st = "status";
      };
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        pull.ff = "only";
        push.autoSetupRemote = true;
      };
      ignores = [ ".DS_Store" ".env" ];
      includes = [{ path = "~/.gitconfig.local"; }];
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraLuaConfig = builtins.readFile ./nvim/init.lua;
    };

    starship = {
      enable = true;
    };

    tmux = {
      enable = true;
      extraConfig = builtins.readFile ./tmux.conf;
    };

    zoxide.enable = true;

    zsh = {
      enable = true;
      enableCompletion = false;
      shellAliases = {
        cat = "bat";
        ls = "exa";
      };
    };
  };
}
