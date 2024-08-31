{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin isLinux isi686 isx86_64 isAarch32 isAarch64;
  vscode-utils = pkgs.vscode-utils;
  merge = lib.attrsets.recursiveUpdate;
in
merge
  (merge
    (merge
      (merge
      {
        "ms-vscode-remote"."remote-ssh" = vscode-utils.extensionFromVscodeMarketplace {
          name = "remote-ssh";
          publisher = "ms-vscode-remote";
          version = "0.113.2024072315";
          sha256 = "07v2rxrbd1zk7ps06qcx0gyfd9nw38iadw5jsw5l2mrr0gx9vsdk";
        };
        "vscodevim"."vim" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vim";
          publisher = "vscodevim";
          version = "1.28.0";
          sha256 = "00q528805b13acm3l0shfpb6kjr09h6k9m9bl432a0hm514k61f8";
        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) { }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) { }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) { }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) { })
