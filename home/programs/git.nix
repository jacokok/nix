{ ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Jaco Kok";
      userEmail = "kokjaco2@gmail.com";
      signing = {
        key = "4CC642FD5A1F0454";
        signByDefault = true;
      };
    };
  };
}
