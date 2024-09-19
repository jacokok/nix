{ inputs, config, sops, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/doink/.config/sops/age/keys.txt";
      generateKey = false;
    };

    secrets = {
      ansibleVault = {
        path = "/home/doink/.ansible/.vault_password.txt";
      };
    };
  };
}
