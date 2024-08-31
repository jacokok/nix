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
      { }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) {
          "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
            name = "csharp";
            publisher = "ms-dotnettools";
            version = "2.45.17";
            sha256 = "034zn8fyxqwyz58giys4sk44l3lzvwva5m3d01zrg60hmaanwj9a";
            arch = "linux-x64";
          };
          "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
            name = "csdevkit";
            publisher = "ms-dotnettools";
            version = "1.10.12";
            sha256 = "1g4vwmyvabbkmc6b07myq3fpjvwr8q7bxba809jlc7hcfqwyw97a";
            arch = "linux-x64";
          };
        }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) {
        "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
          name = "csharp";
          publisher = "ms-dotnettools";
          version = "2.45.17";
          sha256 = "1x98i8h8y0zkyv1w5q5ymrp7hlmabgbypl5w9m79wdlai6y6kxvp";
          arch = "linux-arm64";
        };
        "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
          name = "csdevkit";
          publisher = "ms-dotnettools";
          version = "1.10.12";
          sha256 = "125v68db33ks6fphqla9k4s8rmsx3pqgva3x0f582a9qq3h6jrd4";
          arch = "linux-arm64";
        };
      }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) {
      "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.45.17";
        sha256 = "0qgrv0j8ngsyzh7q14v6xyl93hv7zky997ps2swnqiqlvny9qq57";
        arch = "darwin-x64";
      };
      "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
        name = "csdevkit";
        publisher = "ms-dotnettools";
        version = "1.10.12";
        sha256 = "0yz5c3b6sx2jy51v9d5qkj631krqa6y6v71qhf7h5kvyl23aqk13";
        arch = "darwin-x64";
      };
    }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) {
    "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
      name = "csharp";
      publisher = "ms-dotnettools";
      version = "2.45.17";
      sha256 = "150wh1078zqxaiy68ivdrq70dvlp3lzj62044cpjvp7gcs171nsi";
      arch = "darwin-arm64";
    };
    "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
      name = "csdevkit";
      publisher = "ms-dotnettools";
      version = "1.10.12";
      sha256 = "0phlp8lcl06i53l3cb1k0wbxfp5l07q6vl61by1pvpl4zy8b8azg";
      arch = "darwin-arm64";
    };
  })
