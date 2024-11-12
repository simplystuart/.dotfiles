{ pkgs, lib, ... }: {
  fonts.fontconfig.enable = true;

  home = {
    homeDirectory = "/Users/stuartdum";
    stateVersion = "22.11";
    username = "stuartdum";
  };

  home.activation = {
    unlinkExistingLazyLock = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      if [ -e $HOME/.config/nvim/lazy-lock.json ]; then
        unlink $HOME/.config/nvim/lazy-lock.json
      fi
    '';
    linkLazyLock = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      ln -s $HOME/.config/home-manager/lazy-lock.json $HOME/.config/nvim/lazy-lock.json
    '';
    linkRuby = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      if [ ! -d $HOME/.rubies/ruby-3.3.5/bin ]; then
        mkdir -p $HOME/.rubies/ruby-3.3.5/bin
      fi

      if [ -e $HOME/.rubies/ruby-3.3.5/bin/ruby ]; then
        unlink $HOME/.rubies/ruby-3.3.5/bin/ruby
      fi

      ln -s $HOME/.nix-profile/bin/ruby $HOME/.rubies/ruby-3.3.5/bin/ruby
    '';
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

  home.file.".local/bin" = {
    recursive = true;
    source = ./scripts;
    target = ".local/bin";
  };

  home.packages = [
    pkgs.bat
    pkgs.chruby
    pkgs.coreutils
    pkgs.curl
    pkgs.deno
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-json
    pkgs.exiftool
    pkgs.ffmpeg
    pkgs.findutils
    pkgs.gh
    pkgs.gnugrep
    pkgs.gnused
    pkgs.go
    pkgs.htop
    pkgs.imagemagick
    pkgs.jpegoptim
    pkgs.jq
    pkgs.lazygit
    pkgs.lua51Packages.lua
    pkgs.luajitPackages.luarocks
    pkgs.nerdfonts
    pkgs.nodePackages.prettier
    pkgs.nodejs
    pkgs.prettierd
    pkgs.ripgrep
    pkgs.ruby_3_3
    pkgs.rubyPackages_3_3.rubocop
    pkgs.rustup
    pkgs.scc
    pkgs.ssh-copy-id
    pkgs.stack
    pkgs.tree
    pkgs.watch
    pkgs.wget
    pkgs.yt-dlp
  ];

  programs = {
   # home manager
    home-manager.enable = true;

    # all the rest
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        load_dotenv = true;
      };
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
      withRuby = false;
    };

    starship = {
      enable = true;
    };

    tmux = {
      enable = true;
      extraConfig = builtins.readFile ./tmux.conf;
    };

    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      history = {
        extended = true;
        save = 1000000000;
        size = 1000000000;
      };
      initExtra = ''
        export BUNDLE_CACHE_PATH="$HOME/.cache/bundle"
        export EDITOR=vim
        export PATH="$HOME/.local/bin:$PATH"

        source $HOME/.nix-profile/share/chruby/chruby.sh
        source $HOME/.nix-profile/share/chruby/auto.sh
      '';
      shellAliases = {
        cat = "bat";
        ls = "exa --group-directories-first";
        rbf = "rubocop -f github -a";
      };
      syntaxHighlighting.enable = true;
    };
  };
}
