# Since Nix packages are built in a sandbox where network connection is cut off, we have to work around it.
# One of the simplest way around it is to create the sources as packages.
{ stdenv, fetchurl }:

let
  getWikimanSource = { name, version, url, sha256 }:
    stdenv.mkDerivation rec {
      pname = "wikiman-source-${name}";
      inherit version;

      src = fetchurl { inherit url sha256; };

      unpackPhase = ''
        tar xf $src
      '';

      installPhase = ''
        mkdir -p $out/share/doc/
        cp --recursive ./usr/share/doc/* $out/share/doc/
      '';
    };
in {
  arch = getWikimanSource {
    name = "arch-wiki";
    version = "20200903";
    url =
      "https://github.com/filiparag/wikiman/releases/download/2.9/arch-wiki_20200903.tar.xz";
    sha256 = "sha256-pdLGUVt9v/s98i9hhbGS/zvwW4ChADVRqEput9fg9yc=";
  };

  gentoo = getWikimanSource {
    name = "gentoo-wiki";
    version = "20200831";
    url =
      "https://github.com/filiparag/wikiman/releases/download/2.7/gentoo-wiki_20200831-1.tar.xz";
    sha256 = "sha256-a460fy4wfHCTi69bWZyZAGtcjWc38mS1q2bcPYDSVvM=";
  };

  freebsd = getWikimanSource {
    name = "freebsd-docs";
    version = "20200903";
    url =
      "https://github.com/filiparag/wikiman/releases/download/2.9/freebsd-docs_20200903.tar.xz";
    sha256 = "sha256-n1ScUh37eWuAb7FyUNm254EEfwz7HwL3LmBuVjUPc/Y=";
  };

  tldr = getWikimanSource {
    name = "tldr-pages";
    version = "20200903";
    url =
      "https://github.com/filiparag/wikiman/releases/download/2.9/tldr-pages_20200903.tar.xz";
    sha256 = "sha256-XGYfT1w6vgp78tERtDhU+Gh22ds63uG27V0FS3fNsd4=";
  };
}
