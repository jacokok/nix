{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "abc-fonts";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "doinkerasie";
    repo = "fonts";
    rev = "8f0a0b27fa7d67806d30e936b220cf74e18f8a22";
    hash = "sha256-GMKUbbzwM/B8Fn7GvByuoLDWT6LJdeC7uJPFMKFno6s=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    install -m644 $src/abc/*.ttf $out/share/fonts/truetype/
  '';
}
