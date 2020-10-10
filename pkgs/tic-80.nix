{ stdenv,
  alsaLib,
  cmake,
  curl,
  fetchFromGitHub,
  freeglut,
  gtk3,
  libGLU,
  mesa,
  pkgconfig }:

stdenv.mkDerivation rec {
  pname = "tic-80";
  version = "0.80.1344";

  src = fetchFromGitHub {
    owner = "nesbox";
    repo = "TIC-80";
    rev = "v${version}";
    sha256 = "0b1qm1m1wwss4bh3q8gx26kk4g8j4n9mzdd4lbyj7k37fx5v09rp";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake pkgconfig ];

  buildInputs = [
    alsaLib
    curl
    freeglut
    gtk3
    libGLU
    mesa
  ];

  postUnpack = ''
    substituteInPlace source/CMakeLists.txt \
      --replace "/usr/share/applications/" "$out/bin" \
      --replace "/usr/share/icons/" "$out/share/icons" \
      --replace "install (FILES \''${PROJECT_SOURCE_DIR}/build/linux/tic80.desktop DESTINATION \''${TIC80_DESKTOP_DIR})" "install (FILES \''${PROJECT_SOURCE_DIR}/build/linux/tic80.desktop DESTINATION $out/share/applications)" \
      --replace "install (FILES \''${PROJECT_SOURCE_DIR}/build/linux/tic80.xml DESTINATION \''${TIC80_DESKTOP_DIR})" "install (FILES \''${PROJECT_SOURCE_DIR}/build/linux/tic80.xml DESTINATION $out/share/applications)"
  '';

  cmakeFlags = [
    "-DBUILD_PRO=TRUE"
  ];

  meta = with stdenv.lib; {
    description = "A fantasy computer with built-in game dev tools.";
    homepage = "https://tic80.com/";
    license = licenses.mit;
    maintainers = with maintainers; [ foo-dogsquared ];
  };
}

