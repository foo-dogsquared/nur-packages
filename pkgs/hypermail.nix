{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "hypermail";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "hypermail-project";
    repo = "${pname}"
    rev = "v2.4.0";
    sha256 = stdenv.lib.fakeSha256;
  };
}
