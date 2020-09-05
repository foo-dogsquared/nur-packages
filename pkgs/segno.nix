# As of 2020-09-06, there will be no testing due to one of the library (pyzbar) being broken.
# See the following issue:
# https://github.com/NixOS/nixpkgs/issues/7307
{ stdenv, fetchFromGitHub, python3,
#  pypng,
#  pyzbar
}:

with python3.pkgs; buildPythonApplication rec {
  pname = "segno";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "heuer";
    repo = "segno";
    rev = "1.3.1";
    sha256 = "103mw0ki37lq21cyyzp57qv76fkxy0d234d61zclgvgs607h74zq";
  };

  # For now, testing will be skipped due to broken library.
  doCheck = false;
  checkInputs = [
    pypng
    pytest
    pyzbar
    sphinx
  ];

  meta = with stdenv.lib; {
    description = "Encode QR codes without dependencies (except Python).";
    homepage = https://github.com/heuer/segno;
    license = licenses.bsd3;
    maintainers = with maintainers; [ foo-dogsquared ];
  };
}
