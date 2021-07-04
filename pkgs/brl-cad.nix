# I don't use this one anymore (only for a certain class).
# I'll get rid of this, eventually.
# But I want to make this as a practice package for a package this complex for now. ;p
#
# I doubt this will reach into the nixpkgs repo since "MANY BINARIES" + "COMPLEX AF" = "REALLY HARD TO TEST THIS OUT".
# It was stupid of me to request BRL-CAD in the nixpkgs issue tracker now that I think about it.
{ lib, clangStdenv, cmake, fetchsvn, libGL, libXi, libXft, ncurses }:

clangStdenv.mkDerivation rec {
  pname = "brl-cad";
  version = "7.30.10";

  src = let
    repo = "brlcad";
    tag = builtins.replaceStrings [ "." ] [ "-" ] version;
    revision = "77067";
  in fetchsvn {
    url = "svn://svn.code.sf.net/p/${repo}/code/${repo}/tags/rel-${tag}";
    rev = revision;
    sha256 = "1wmx1mr2a2zk20qx1inngsi0d4cfvfaqdzb9k84ijzrkil2zbs7d";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [ libGL libXft libXi ncurses ];

  cmakeFlags = [
    "-DBRLCAD_ENABLE_STRICT=OFF"
    "-DBRLCAD_BUNDLED_LIBS=ON"
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  enableParallelBuilding = true;

  meta = with lib; {
    broken = true;
    description = "A free and open-source 3D solid modelling system.";
    homepage = "http://www.brlcad.org/";
    license = licenses.free;
    platforms = platforms.linux ++ platforms.freebsd ++ platforms.netbsd
      ++ platforms.openbsd;
  };
}
