{ stdenv, fetchFromGitHub,
findutils,
fzf,
gawk,
ripgrep,
w3m,
}:

stdenv.mkDerivation rec {
  pname = "wikiman";
  version = "2.11.1";

  src = fetchFromGitHub {
    owner = "filiparag";
    repo = "wikiman";
    rev = "${version}";
    sha256 = "01ir6q5iwxms01l2j3md10ixfb06gjb42d9sjr665qhy0rh9sgr5";
  };

  patches = [
    ./wikiman-nix.patch
  ];
  postPatch= ''
    substituteInPlace wikiman.sh --replace "@INSTALL_DIR@" $out
    substituteInPlace Makefile --replace "@INSTALL_DIR@" $out
  '';

  buildInputs = [ fzf gawk ripgrep w3m ];
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
    install -Dm644 wikiman.conf $out/share/wikiman/wikiman.conf
    install -Dm644 README.md $out/share/doc/wikiman
    tar -czf $out/man/man1/${pname}.1.gz ./${pname}.1.man
  '';

  meta = with stdenv.lib; {
    description = "A command-line interface for searching between documentation sources such as Arch Wiki, Gentoo Wiki, etc.";
    homepage = "https://github.com/filiparag/wikiman";
    license = licenses.mit;
    maintainers = [ maintainers.foo-dogsquared ];
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
