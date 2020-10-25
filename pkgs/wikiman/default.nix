{ stdenv, fetchFromGitHub, callPackage, findutils, fzf, gawk, ripgrep, w3m
, installShellFiles,

# Make a parameter for enabling each source.
enableArchSource ? false, enableGentooSource ? false
, enableFreeBSDSource ? false, enableTLDRSource ? false, }:

let
  wikiman-sources = callPackage ./wikiman-sources.nix { };
  installSources = cond: pkg:
    stdenv.lib.optionalString cond
    "mkdir -p $out/share/doc/ && cp --recursive ${pkg}/share/doc/* $out/share/doc";
in stdenv.mkDerivation rec {
  pname = "wikiman";
  version = "2.12.1";

  src = fetchFromGitHub {
    owner = "filiparag";
    repo = "wikiman";
    rev = "${version}";
    sha256 = "sha256-+TTjzD3qkvSsaXgHEgHKGpNqkEs3ERNCsFzlvonNhRY=";
  };

  patches = [ ./wikiman-nix.patch ];

  postPatch = ''
    substituteInPlace wikiman.sh --replace "@INSTALL_DIR@" $out
    substituteInPlace Makefile --replace "@INSTALL_DIR@" $out
  '';

  nativeBuildInputs = [ fzf gawk ripgrep w3m installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin \
             $out/share/${pname} \
             $out/share/licenses/${pname} \
             $out/share/doc/${pname} \
             $out/man/man1

    install -Dm755 ./${pname}.sh $out/bin/${pname}
    cp -fr sources $out/share/${pname}
    cp -fr widgets $out/share/${pname}
    install -Dm644 LICENSE $out/share/licenses/${pname}
    install -Dm644 wikiman.conf $out/share/${pname}/wikiman.conf
    install -Dm644 README.md $out/share/doc/${pname}

    installManPage wikiman.1.man
    installShellCompletion completions/completions.{bash,fish,zsh}

    ${installSources enableArchSource wikiman-sources.arch}
    ${installSources enableGentooSource wikiman-sources.gentoo}
    ${installSources enableFreeBSDSource wikiman-sources.freebsd}
    ${installSources enableTLDRSource wikiman-sources.tldr}
  '';

  meta = with stdenv.lib; {
    description =
      "A command-line interface for searching between documentation sources such as Arch Wiki, Gentoo Wiki, etc.";
    homepage = "https://github.com/filiparag/wikiman";
    license = licenses.mit;
    maintainers = [ maintainers.foo-dogsquared ];
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
