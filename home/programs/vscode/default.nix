{ pkgs, lib, ... }:
let
  plugins = (import ./vscode_plugins.nix) { pkgs = pkgs; lib = lib; };
in
with pkgs;
{
  programs = {
    vscode = {
      enable = true;

      package = pkgs.vscode;

      mutableExtensionsDir = true;
      # enableUpdateCheck = false;
      # enableExtensionUpdateCheck = false;

      extensions = (with vscode-marketplace; [
        plugins.ms-dotnettools.csdevkit
        plugins.ms-dotnettools.vscode-dotnet-runtime
      ]) ++ (with pkgs.vscode-extensions; [
        ms-dotnettools.csharp
      ]);

      # extensions = (with (pkgs.forVSCodeVersion pkgs.vscode.version).vscode-marketplace; [
      #   # ms-dotnettools.csdevkit
      #   ms-dotnettools.vscode-dotnet-runtime
      #   # ms-dotnettools.csharp
      #   # ms-dotnettools.csdevkit
      #   ms-azuretools.vscode-docker
      #   jacokok.csharp-stretch
      #   streetsidesoftware.code-spell-checker
      #   ms-vscode-remote.remote-containers
      #   mikestead.dotenv
      #   dbaeumer.vscode-eslint
      #   tamasfe.even-better-toml
      #   mhutchie.git-graph
      #   donjayamanne.githistory
      #   github.vscode-github-actions
      #   ms-python.isort
      #   yzhang.markdown-all-in-one
      #   davidanson.vscode-markdownlint
      #   pkief.material-icon-theme
      #   jnoortheen.nix-ide
      #   csstools.postcss
      #   esbenp.prettier-vscode
      #   yoavbls.pretty-ts-errors
      #   ms-python.python
      #   ms-python.debugpy
      #   redhat.vscode-commons
      #   # ms-vscode-remote.remote-ssh
      #   # ms-vscode-remote.remote-ssh-edit
      #   ms-vscode.remote-explorer
      #   svelte.svelte-vscode
      #   bradlc.vscode-tailwindcss
      #   tomoki1207.pdf
      #   redhat.vscode-yaml
      #   #codeium.codeium
      # ]) ++ (with pkgs.vscode-extensions; [
      #   ms-dotnettools.csharp
      # ]) ++ (with pkgs.vscode-marketplace; [
      #   plugins.ms-dotnettools.csdevkit
      #   plugins.ms-dotnettools.csharp
      # ]);

      # userSettings = {
      #   "editor.smoothScrolling" = true;
      #   "editor.acceptSuggestionOnCommitCharacter" = false;
      #   "editor.fontFamily" = "'FiraCode Nerd Font', 'Fira Code', Consolas";
      #   "editor.fontLigatures" = true;
      #   "editor.minimap.maxColumn" = 100;
      #   "editor.cursorBlinking" = "smooth";
      #   "editor.cursorSmoothCaretAnimation" = "on";
      #   "editor.semanticHighlighting.enabled" = true;
      #   "editor.formatOnSave" = true;
      #   "editor.minimap.showSlider" = "always";
      #   "editor.linkedEditing" = true;
      #   "editor.defaultFormatter" = "esbenp.prettier-vscode";

      #   "workbench.list.smoothScrolling" = true;
      #   "workbench.iconTheme" = "material-icon-theme";
      #   "workbench.startupEditor" = "readme";
      #   "workbench.layoutControl.enabled" = false;
      #   "workbench.sideBar.location" = "right";
      #   "workbench.editor.empty.hint" = "hidden";
      #   "workbench.colorCustomizations" = {
      #     "statusBar.background" = "#323233";
      #     "statusBarItem.remoteBackground" = "#323233";
      #   };

      #   "breadcrumbs.enabled" = false;

      #   "window.titleBarStyle" = "custom";
      #   "window.zoomLevel" = 2;
      #   "window.commandCenter" = false;
      #   "window.title" = "\${activeEditorShort}\${separator}\${rootName}\${separator}";

      #   "explorer.confirmDelete" = false;

      #   "git.confirmSync" = false;
      #   "git.mergeEditor" = true;
      #   "git.autofetch" = true;
      #   "git.openRepositoryInParentFolders" = "never";

      #   "[csharp]" = {
      #     "editor.defaultFormatter" = "ms-dotnettools.csharp";
      #     "editor.formatOnSave" = true;
      #   };

      #   "csharp.semanticHighlighting.enabled" = true;
      #   "csharp.suppressHiddenDiagnostics" = false;
      #   "csharp.maxProjectFileCountForDiagnosticAnalysis" = 0;
      #   "dotnet.completion.showCompletionItemsFromUnimportedNamespaces" = true;
      #   "dotnetAcquisitionExtension.enableTelemetry" = false;

      #   "[typescript]" = {
      #     "editor.tabSize" = 2;
      #   };
      #   "typescript.updateImportsOnFileMove.enabled" = "always";

      #   "[svelte]" = {
      #     "editor.defaultFormatter" = "svelte.svelte-vscode";
      #     "editor.formatOnSave" = true;
      #     "editor.tabSize" = 2;
      #   };
      #   "svelte.enable-ts-plugin" = true;

      #   "[nix]" = {
      #     "editor.insertSpaces" = true;
      #     "editor.tabSize" = 2;
      #     "editor.formatOnSave" = true;
      #   };
      #   "[javascript]" = {
      #     "editor.tabSize" = 2;
      #   };
      #   "javascript.updateImportsOnFileMove.enabled" = "always";

      #   "eslint.format.enable" = true;
      #   "prettier.singleQuote" = false;

      #   "[jsonc]" = {
      #     "editor.defaultFormatter" = "vscode.json-language-features";
      #   };
      #   "[markdown]" = {
      #     "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
      #   };
      #   "[json]" = {
      #     "editor.tabSize" = 2;
      #   };
      #   "yaml.schemaStore.enable" = true;

      #   "diffEditor.ignoreTrimWhitespace" = true;
      #   "redhat.telemetry.enabled" = true;
      #   "security.workspace.trust.untrustedFiles" = "open";
      # };
    };
  };
}
