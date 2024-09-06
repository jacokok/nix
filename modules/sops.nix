{ config, sops, ... }:

{
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/doink/.config/sops/age/keys.txt";
  sops.age.generateKey = false;

  sops.secrets.test = {
    owner = config.users.users.doink.name;
  };

  sops.secrets.ansibleVault = {
    owner = config.users.users.doink.name;
    path = "${config.users.users.doink.home}/.ansible/.vault_password.txt";
  };
}
