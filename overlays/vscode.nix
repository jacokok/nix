final: prev: {
  vscode = prev.vscode.overrideAttrs (_: rec {
    version = "1.87.0";
    plat = "linux-x64";
    archive_fmt = "tar.gz";
    pname = "vscode";
    src = prev.fetchurl {
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      sha256 = "00izdy01d34czxfjn6rv4vg179r7f264bls5fib4caakj9bblalw";
      name = "VSCode_${version}_${plat}.${archive_fmt}";
    };
  });
}
