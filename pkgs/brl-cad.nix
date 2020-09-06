# A solid 3D modelling tool (or something)...
{ stdenv, fetchsvn, fetchpatch,
appleseed,
byacc,
clang,
cmake,
flex,
fontconfig,
gnumake,
libGL,
libXi,
libXft,
libxslt,
ncurses,
subversion,
zlib,
}:

stdenv.mkDerivation rec {
  pname = "brl-cad";
  version = "7.30.10";
 
  src = let
    repo = "brlcad";
    tag = builtins.replaceStrings ["."] ["-"] version;
    revision = "77067";
    in fetchsvn {
      url = "svn://svn.code.sf.net/p/${repo}/code/${repo}/tags/rel-${tag}";
      rev = revision;
      sha256 = "1wmx1mr2a2zk20qx1inngsi0d4cfvfaqdzb9k84ijzrkil2zbs7d";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    clang
    libGL
    libXft
    libXi
    ncurses
  ];

  cmakeFlags = [
    "-DBRLCAD_INSTALL_EXAMPLE_GEOMETRY=ON"
    "-DBRLCAD_ENABLE_OPENGL=ON"
    "-DBRLCAD_ENABLE_STRICT=OFF"
    "-DBRLCAD_BUNDLED_LIBS=ON"
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "A free and open-source 3D solid modelling system.";
    homepage = "http://www.brlcad.org/";
    license = licenses.free;
    maintainers = [ maintainers.foo-dogsquared ];
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
