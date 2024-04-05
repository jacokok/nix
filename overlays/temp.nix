final: prev: {
  beekeeper-studio = prev.beekeeper-studio.overrideAttrs (_: rec {
    pname = "beekeeper-studio";
    version = "4.2.8";
    plat = "";
    src = prev.fetchurl {
      url = "https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${version}/Beekeeper-Studio-${version}${plat}.AppImage";
      hash = "sha256-e3HGtvINTo+UP4V6KSM89haD9+mqDgqoF949ql8EFB4=";
    };
  });
}
