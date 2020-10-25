# Based from the AUR PKGBUILD at https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=license.
{ stdenv, fetchgit, rustPlatform, scdoc, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "license";
  version = "2.0.0";

  nativeBuildInputs = [ installShellFiles ];

  src = fetchgit {
    url = "https://git.sr.ht/~zethra/license";
    rev = "${version}";
    sha256 = "sha256-TiLBnbYK0UYXqJ9qeFekfUZ6IPeoxRqC0mtCR7D90Z8=";
  };

  cargoSha256 = "sha256-cKPntSkf+tp62/cZkNU/mdhuRx+30D+wu6GTjfcNpsg=";

  postInstall = ''
    ${scdoc}/bin/scdoc < doc/license.scd > license.1
    installManPage license.1

    installShellCompletion completions/{_license,license.bash,license.fish}
    cp scripts/* $out/bin
  '';

  meta = with stdenv.lib; {
    description =
      "Command-line tool to easily add a license file to your project";
    homepage = "https://git.sr.ht/~zethra/license";
    license = licenses.mpl20;
    maintainers = with maintainers; [ foo-dogsquared ];
  };
}

