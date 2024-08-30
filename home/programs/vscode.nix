{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;

      package = pkgs.vscode;

      mutableExtensionsDir = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = (with (pkgs.forVSCodeVersion pkgs.vscode.version).vscode-marketplace; [
        ms-dotnettools.csdevkit
        ms-dotnettools.vscode-dotnet-runtime
        # ms-dotnettools.csharp
        # ms-dotnettools.csdevkit
        ms-azuretools.vscode-docker
        jacokok.csharp-stretch
        streetsidesoftware.code-spell-checker
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
        # ms-vscode-remote.remote-ssh
        # ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-explorer
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
        tomoki1207.pdf
        redhat.vscode-yaml
        #codeium.codeium
      ]) ++ (with pkgs.vscode-extensions; [
        ms-dotnettools.csharp
      ]);

      userSettings = {
        "editor.smoothScrolling" = true;
        "editor.acceptSuggestionOnCommitCharacter" = false;
        "editor.fontFamily" = "'FiraCode Nerd Font', 'Fira Code', Consolas";
        "editor.fontLigatures" = true;
        "editor.minimap.maxColumn" = 100;
        "editor.cursorBlinking" = "smooth";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.semanticHighlighting.enabled" = true;
        "editor.formatOnSave" = true;

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

        "git.confirmSync" = false;
        "git.mergeEditor" = true;
        "git.autofetch" = true;
        "git.openRepositoryInParentFolders" = "never";

        "extensions.autoCheckUpdates" = false;
        "extensions.autoUpdate" = false;
      };
    };
  };
}
