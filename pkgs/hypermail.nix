{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "hypermail";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "hypermail-project";
    repo = "${pname}";
    rev = "v2.4.0";
    sha256 = stdenv.lib.fakeSha256;
  };

  meta = with stdenv.lib; {
    description = "A converter for emails from Unix mbox format.";
    homepage = "http://www.hypermail-project.org/";
    license = licenses.gpl;
    maintainers = [ maintainers.foo-dogsquared ];
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
