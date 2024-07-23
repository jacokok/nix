{ config, sops, ... }:

{
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/doink/.config/sops/age/keys.txt";
  sops.age.generateKey = false;

  sops.secrets.test = {
    owner = config.users.users.doink.name;
  };
}
