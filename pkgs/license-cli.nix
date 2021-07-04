# Based from the AUR PKGBUILD at https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=license.
{ stdenv, lib, fetchgit, rustPlatform, scdoc, installShellFiles }:

rustPlatform.buildRustPackage rec {
  pname = "license";
  version = "2.5.0";

  nativeBuildInputs = [ installShellFiles ];

  src = fetchgit {
    url = "https://git.sr.ht/~zethra/license";
    rev = "${version}";
    sha256 = "sha256:0dwrciyfr2ac6lh0xyws9vz60xqwdfd0mli99fkvshccyff9yfdj";
  };

  cargoSha256 = "sha256:1vq373935dyjlg4d4rr62ab3fcglcrwc86748yal1az2bh7wac98";

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

