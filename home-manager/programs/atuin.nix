{
  programs.atuin = {
    enable = true;
    # flags = [ "--disable-up-arrow" ];
    settings = {
      auto_sync = true;
      filter_mode = "host";
      filter_mode_shell_up_key_binding = "session";
      style = "compact";
      enter_accept = true;
      keymap_mode = "vim-insert";
      show_help = false;
      update_check = false;

      stats = {
        common_subcommands = [
          "docker"
          "git"
          "go"
          "nix"
          "systemctl"
          "tmux"
        ];
        ignored_commands = [
          "cd"
          "ls"
          "vi"
          "vim"
        ];
      };
    };
  };
}
