final: prev: {
  vscode = prev.vscode.overrideAttrs (_: rec {
    version = "1.88.0";
    plat = "linux-x64";
    archive_fmt = "tar.gz";
    pname = "vscode";
    src = prev.fetchurl {
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      sha256 = "sha256-rq8WUApP3LDbhV9gvovK20o2QbZikHwhnDf7JdcdKE8=";
      name = "VSCode_${version}_${plat}.${archive_fmt}";
    };
  });
}
