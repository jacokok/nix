{ stdenv
, fetchFromGitHub
,
}:
stdenv.mkDerivation rec {
  pname = "segoe-ui";
  version = "master-2024-04-16";

  src = fetchFromGitHub {
    owner = "mrbvrz";
    repo = "segoe-ui-linux";
    rev = "bd87b323a5776c062e7e9512a901ac5e3fb6fe8f";
    hash = "sha256-fCfb2IMFDf2h9gdJIslgQkR9PEYvTkOi3l2E7VYiZ3Y=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    install -m644 $src/font/*.ttf $out/share/fonts/truetype/
  '';
}
