{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "wikiman";
  version = "2.9";

  src = fetchFromGitHub {
    owner = "filiparag";
    repo = "wikiman";
    rev = "2.9";
    sha256 = stdenv.lib.fakeSha256;
  };

  patchPhase = ''
    patchShebangs wikiman.sh
  '';

  meta = with stdenv.lib; {
    description = "A command-line interface for searching between documentation sources such as Arch Wiki, Gentoo Wiki, etc.";
    homepage = "https://github.com/filiparag/wikiman";
    license = licenses.mit;
    maintainers = [ maintainers.foo-dogsquared ];
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
