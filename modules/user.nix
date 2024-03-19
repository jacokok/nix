{ ... }:

{
  users.users.doink = {
    isNormalUser = true;
    description = "doink";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
