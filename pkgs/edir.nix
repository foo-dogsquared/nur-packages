{ stdenv, fetchFromGitHub, python3 }:

with python3.pkgs; buildPythonApplication rec {
  pname = "edir";
  version = "2.4";

  src = fetchFromGitHub {
    owner = "bulletmark";
    repo = "edir";
    rev = "${version}";
    sha256 = "sha256-Bm3BE/dCvFLAHsQO6gf2rcvNVBjzDeh2YpwOz9gxmug=";
  };

  meta = with stdenv.lib; {
    description = "Rename and edit files using your editor.";
    homepage = https://github.com/bulletmark/edir;
    license = licenses.gpl3;
    maintainers = with maintainers; [ foo-dogsquared ];
  };
}
