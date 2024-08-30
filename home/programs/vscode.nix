{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      # enableUpdateCheck = false;
      # package = pkgs.vscode.fhs;
      # package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      #   glib
      #   glibc.static
      #   zlib.static
      #   icu.dev
      #   musl
      #   openssl
      # ]);
      # package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      #   zlib
      #   glibc
      #   curl
      #   openssl
      #   gdb
      #   (with dotnetCorePackages;
      #   combinePackages [
      #     sdk_8_0
      #   ])
      # ]);

      mutableExtensionsDir = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs.vscode-marketplace; [
        ms-azuretools.vscode-docker
        ms-dotnettools.vscode-dotnet-runtime
        jacokok.csharp-stretch
        streetsidesoftware.code-spell-checker
        codeium.codeium
        ms-vscode-remote.remote-containers
        mikestead.dotenv
        dbaeumer.vscode-eslint
        tamasfe.even-better-toml
        mhutchie.git-graph
        donjayamanne.githistory
        github.vscode-github-actions
        ms-python.isort
        yzhang.markdown-all-in-one
        davidanson.vscode-markdownlint
        pkief.material-icon-theme
        jnoortheen.nix-ide
        csstools.postcss
        esbenp.prettier-vscode
        yoavbls.pretty-ts-errors
        ms-python.python
        ms-python.debugpy
        redhat.vscode-commons
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-explorer
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
        tomoki1207.pdf
        redhat.vscode-yaml
      ]
      ++
      (with pkgs.vscode-extensions;
      [
        ms-dotnettools.csharp
        ms-dotnettools.csdevkit
      ]);

      userSettings = {
        "editor" = {
          "smoothScrolling" = true;
          "acceptSuggestionOnCommitCharacter" = false;
          "fontFamily" = "'FiraCode Nerd Font', 'Fira Code', Consolas";
          "fontLigatures" = true;
          "minimap.maxColumn" = 100;
          "cursorBlinking" = "smooth";
          "cursorSmoothCaretAnimation" = "on";
          "semanticHighlighting.enabled" = true;
          "formatOnSave" = true;
        };

        "workbench.list.smoothScrolling" = true;
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.startupEditor" = "readme";
        "workbench.layoutControl.enabled" = false;
        "workbench.sideBar.location" = "right";
        "workbench.colorCustomizations" = {
          "statusBar.background" = "#323233";
          "statusBarItem.remoteBackground" = "#323233";
        };
        "breadcrumbs.enabled" = false;
        "window.titleBarStyle" = "custom";
        "window.zoomLevel" = 2;
        "window.commandCenter" = false;
        "explorer.confirmDelete" = false;
        "git" = {
          "confirmSync" = false;
          "mergeEditor" = true;
          "autofetch" = true;
          "openRepositoryInParentFolders" = "never";
        };

      };
    };
  };
}
