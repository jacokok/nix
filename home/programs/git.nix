{ ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Jaco Kok";
      userEmail = "kokjaco2@gmail.com";
      signing = {
        key = "7ABD453C60720B82";
        signByDefault = true;
      };
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        core.editor = "nvim";

        rebase = {
          autostash = true;
          autosquash = true;
        };
      };
    };
  };
}
