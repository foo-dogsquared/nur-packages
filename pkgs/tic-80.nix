{ stdenv, lib, alsaLib, cmake, fetchFromGitHub, freeglut, gtk3, libGLU, libglvnd, mesa
, pkgconfig }:

stdenv.mkDerivation rec {
  pname = "tic-80";
  version = "ad6fac460480ca2eff25e6ef142460b9ff7bdcef";

  src = fetchFromGitHub {
    owner = "nesbox";
    repo = "TIC-80";
    rev = "ad6fac460480ca2eff25e6ef142460b9ff7bdcef";
    sha256 = "0z77hppxpadh0vday315bkiy21ffdx7i1df4k5xr874yyl0aw6k5";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake pkgconfig ];

  buildInputs = [ alsaLib freeglut gtk3 libGLU libglvnd mesa ];

  cmakeFlags = [ "-DBUILD_PRO=ON" ];

  meta = with lib; {
    description = "A fantasy computer with built-in game dev tools.";
    homepage = "https://tic80.com/";
    license = licenses.mit;
  };
}

