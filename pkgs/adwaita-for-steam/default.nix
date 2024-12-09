{
  stdenvNoCC,
  fetchFromGitHub,
  python3,
  ...
}:

stdenvNoCC.mkDerivation rec {
  name = "adwaita-for-steam";
  version = "3.1";

  src = fetchFromGitHub {
    owner = "tkashkin";
    repo = "Adwaita-for-Steam";
    rev = "v${version}";
    sha256 = "sha256-V2Ps4jP7UeoXTY1q7gLbWVQW9WwUzMM6RPYUvNDAJ0I=";
  };

  preferLocalBuild = true;

  nativeBuildInputs = [ python3 ];

  installPhase = ''
    mkdir -p $out/build
    mkdir -p $out/build/steamui
    mkdir -p $out/build/steamui/css
    echo "@import url(\"https://steamloopback.host/css/library.original.css\");
          @import url(\"https://steamloopback.host/libraryroot.custom.css\");" >> $out/build/steamui/css/library.css
    NIX_OUT="$out" python install.py -c catppuccin-mocha -t $out/build
  '';
}
