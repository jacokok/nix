final: prev: {
  dotnetCorePackages.dotnet_8.sdk = prev.dotnetCorePackages.dotnet_8.sdk.overrideAttrs (_: rec {
    postInstall = ''
      for i in $out/sdk/*
        do
          i=$(basename $i)
          length=$(printf "%s" "$i" | wc -c)
          substring=$(printf "%s" "$i" | cut -c 1-$(expr $length - 2))
          i="$substring""00"
          mkdir -p $out/metadata/workloads/''${i/-*}
          touch $out/metadata/workloads/''${i/-*}/userlocal
      done
    '';
  });
}
