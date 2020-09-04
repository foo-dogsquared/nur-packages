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
subversion
}:

stdenv.mkDerivation rec {
  pname = "brl-cad";
  version = "7.30.10";
 
  src = let
    repo = "brlcad";
    tag = builtins.replaceStrings ["."] ["-"] version;
    revision = "77033";
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

  patches = [
    (fetchpatch {
      url = "https://aur.archlinux.org/cgit/aur.git/plain/build.patch?h=brlcad";
      sha256 = "0ib95q4jcixalvs5wch4ffj4116wbnw1bwmv0jqmjir0f0hxrpc1";
    })
  ];

  cmakeFlags = [
    "-DBRLCAD_ENABLE_STRICT=NO"
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
