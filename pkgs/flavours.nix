# Based from the AUR PKGBUILD at https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=license.
{ stdenv, fetchgit, rustPlatform, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "license";
  version = "0.2.2";

  nativeBuildInputs = [ installShellFiles ];

  src = fetchgit {
    url = "https://github.com/Misterio77/flavours";
    rev = "v${version}";
    sha256 = "sha256-oxb7EXBYWLALSD09bw7jc4jTYyzwYAWguLM35l3ekBo=";
  };

  cargoSha256 = "sha256-CryDdt9Nbr0HkXnwKTnRKWDKOVAvk7MMqstEjC2xa/E=";

  meta = with stdenv.lib; {
    description =
      "Command-line tool to manage Base16 schemes and templates";
    homepage = "https://github.com/Misterio77/flavours";
    license = licenses.mit;
    maintainers = with maintainers; [ foo-dogsquared ];
  };
}

