{ stdenv, fetchFromGitHub, yacc }:

stdenv.mkDerivation rec {
  pname = "hypermail";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "hypermail-project";
    repo = "${pname}";
    rev = "2604af96c85713bb1abe15497af6fc17d4e05678";
    sha256 = "1h65k02py1y9hc6y5235ysss260nyfy3zkxvq22gi4ckw6wrfkvs";
  };

  buildInputs = [ yacc ];

  patchPhase = ''
    patchShebangs install-sh
    sed -i 's/-s -c -m [[:digit:]]\{3,4\}//' src/Makefile.in
  '';

  configureFlags = ''
    --with-httpdir="$out/share/hypermail" --with-htmldir="$out/share/hypermail/docs"
  '';

  meta = with stdenv.lib; {
    description = "A converter for emails from Unix mbox format.";
    homepage = "http://www.hypermail-project.org/";
    license = licenses.gpl2;
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
