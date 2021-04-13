# Based from the AUR PKGBUILD at https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=license.
{ stdenv, lib, fetchgit, rustPlatform, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "flavours";
  version = "0.4.0";

  nativeBuildInputs = [ installShellFiles ];

  src = fetchgit {
    url = "https://github.com/Misterio77/flavours";
    rev = "v${version}";
    sha256 = "sha256:01x03fwznvg452zb8zqw7yhlazbn401a42cb1cbmzy70v3kvqg5c";
  };

  cargoSha256 = "sha256:0nk56bf3bmji9zra268yqkz0clgivpip8riaxgr542gnjbglgii3";

  meta = with stdenv.lib; {
    description =
      "Command-line tool to manage Base16 schemes and templates";
    homepage = "https://github.com/Misterio77/flavours";
    license = licenses.mit;
  };
}

