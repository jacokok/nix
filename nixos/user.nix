{
  users.users.doink = {
    isNormalUser = true;
    description = "Doink";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "dialout"
      "libvirtd"
    ];
  };
}
