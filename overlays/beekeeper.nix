final: previous:
with final;
let
  pname = "beekeeper-studio";
  version = "4.2.9";
  plat = "";
  src = fetchurl {
    url = "https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${version}/Beekeeper-Studio-${version}${plat}.AppImage";
    hash = "sha256-hGQoVMbo/DfzSaaASVPJ/3uV0Rjz+DIZXdMuNOcSTxk=";
  };

  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
{
  beekeeper-studio = appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = ''
      mv $out/bin/{${pname}-${version},${pname}}
      source "${makeWrapper}/nix-support/setup-hook"
      wrapProgram $out/bin/${pname} \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
      install -Dm444 ${appimageContents}/${pname}.desktop -t $out/share/applications/
      install -Dm444 ${appimageContents}/${pname}.png -t $out/share/pixmaps/
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun --no-sandbox' 'Exec=${pname}'
    '';
  };
}
