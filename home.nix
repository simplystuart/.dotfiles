{ pkgs, lib, ... }: {
  fonts.fontconfig.enable = true;

  home = {
    homeDirectory = "/Users/stuartdum";
    stateVersion = "22.11";
    username = "stuartdum";
  };

  home.activation = {
    unlinkLastLazyLock = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      if [ -e $HOME/.config/nvim/lazy-lock.json ]; then
        unlink $HOME/.config/nvim/lazy-lock.json
      fi
    '';
    addBatTheme = lib.hm.dag.entryAfter [ "installPackages" ] ''
      if [ ! -d $HOME/.config/bat/themes ]; then
        mkdir -p $HOME/.config/bat/themes
        ${pkgs.git}/bin/git clone https://github.com/mhanberg/everforest-textmate.git $HOME/.config/bat/themes/everforest-textmate
        ${pkgs.bat}/bin/bat cache --build
      fi
    '';
    linkLatestLazyLock = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      ln -s $HOME/.config/home-manager/lazy-lock.json $HOME/.config/nvim/lazy-lock.json
    '';
    linkRubies = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      if [ ! -e $HOME/.rubies ]; then
        ln -s $HOME/.asdf/installs/ruby $HOME/.rubies
      fi
    '';
  };

  home.file.".config/ghostty/config" = {
    source = ./config;
    target = ".config/ghostty/config";
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
    pkgs.asdf-vm
    pkgs.bat
    pkgs.bun
    pkgs.chruby
    pkgs.coreutils
    pkgs.curl
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-format
    pkgs.elmPackages.elm-json
    pkgs.exiftool
    pkgs.ffmpeg
    pkgs.findutils
    pkgs.gh
    pkgs.git-lfs
    pkgs.gnugrep
    pkgs.gnused
    pkgs.htop
    pkgs.imagemagick
    pkgs.jpegoptim
    pkgs.jq
    pkgs.lazygit
    pkgs.lua51Packages.lua
    pkgs.luajitPackages.luarocks
    pkgs.nerd-fonts.meslo-lg
    pkgs.nodePackages.prettier
    pkgs.nodejs
    pkgs.prettierd
    pkgs.ripgrep
    pkgs.scc
    pkgs.ssh-copy-id
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
      enable = true;
      settings = {
        alias = {
          cm = "commit";
          co = "checkout";
          df = "diff";
          fp = "push --force-with-lease";
          sh = "show";
          st = "status";
        };
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
      initContent = ''
        # general
        export EDITOR=vim
        export PATH="$HOME/.local/bin:$PATH"

        # bun
        export BUN_INSTALL="$HOME/.bun"
        [ -f "$BUN_INSTALL/bin/bun" ] && export PATH="$BUN_INSTALL/bin:$PATH"

        # graphite
        _gt_yargs_completions()
        {
          local reply
          local si=$IFS
          IFS=$'
        ' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "''${words[@]}"))
          IFS=$si
          _describe 'values' reply
        }
        compdef _gt_yargs_completions gt

        # homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # lanugages
        source $HOME/.nix-profile/share/asdf-vm/asdf.sh

        # opencode
        export OPENCODE_INSTALL="$HOME/.opencode"
        [ -f "$OPENCODE_INSTALL/bin/opencode" ] && export PATH="$OPENCODE_INSTALL/bin:$PATH"

        # python
        export PYENV_ROOT="$HOME/.pyenv"
        [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init - zsh)"

        # ruby
        source $HOME/.nix-profile/share/chruby/chruby.sh
        source $HOME/.nix-profile/share/chruby/auto.sh
        export BUNDLE_CACHE_PATH="$HOME/.cache/bundle"
      '';
      shellAliases = {
        cat = "bat --theme=\"Everforest Dark\"";
        clean = "nix-collect-garbage -d && nix flake update";
        g = "git";
        ls = "exa --group-directories-first";
        reload = "exec $SHELL -l";
        reno = "home-manager switch -b bak";
      };
      syntaxHighlighting.enable = true;
    };
  };
}
