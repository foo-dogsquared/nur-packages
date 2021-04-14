# Based from the AUR PKGBUILD at https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=license.
{ stdenv, lib, fetchgit, rustPlatform, scdoc, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "license";
  version = "2.4.0";

  nativeBuildInputs = [ installShellFiles ];

  src = fetchgit {
    url = "https://git.sr.ht/~zethra/license";
    rev = "${version}";
    sha256 = "sha256:1gdlhhrcdni2g14schrgj8vx8pinvmxwpss8ziiazal9sz1rak47";
  };

  cargoSha256 = "sha256:0r0dj6fd971fifrv8rppvmq6fwlaqrdh54sf9gb4kwfwz8vs5iv8";

  postInstall = ''
    ${scdoc}/bin/scdoc < doc/license.scd > license.1
    installManPage license.1

    installShellCompletion completions/{_license,license.bash,license.fish}
    cp scripts/* $out/bin
  '';

  meta = with lib; {
    description =
      "Command-line tool to easily add a license file to your project";
    homepage = "https://git.sr.ht/~zethra/license";
    license = licenses.mpl20;
  };
}

