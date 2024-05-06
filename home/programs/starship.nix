{ ... }:
{
  programs = {
    starship = {
      enable = true;
      settings = {
        character = {
          success_symbol = "[➜](green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}
