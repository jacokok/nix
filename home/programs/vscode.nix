{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      # enableUpdateCheck = false;
      # userSettings = {
      #   "godot_tools.editor_path" = "${pkgs.godot_4}/bin/godot4";
      #   "godot_tools.gdscript_lsp_server_port" = 6005;
      # };
    };
  };
}
