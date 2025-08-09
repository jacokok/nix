{ ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Jaco Kok";
      userEmail = "kokjaco2@gmail.com";
      delta = {
        enable = true;
        options = {
          line-numbers = true;
          side-by-side = true;
          navigate = true;
        };
      };
      signing = {
        key = "7ABD453C60720B82";
        signByDefault = true;
      };
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        core.editor = "helix";

        rebase = {
          autostash = true;
          autosquash = true;
        };
      };
    };
  };
}
