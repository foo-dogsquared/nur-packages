{ stdenv, fetchFromGitHub, python3 }:

with python3.pkgs;
buildPythonApplication rec {
  pname = "edir";
  version = "2.7.3";

  src = fetchFromGitHub {
    owner = "bulletmark";
    repo = "edir";
    rev = "${version}";
    sha256 = "0ddzyr1gh0ww5pnjs3849vi8j69sxmhy01sa1s8lylc7c6n09ygq";
  };

  meta = with stdenv.lib; {
    description = "Rename and edit files using your editor.";
    homepage = "https://github.com/bulletmark/edir";
    license = licenses.gpl3;
  };
}
