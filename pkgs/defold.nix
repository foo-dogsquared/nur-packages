# https://defold.com/open/
# It'sa game engine for cross-platform development.
{ stdenv, fetchFromGitHub,
autoconf,
automake,
cmake,
curl,
emscripten,
freeglut,
gcc,
git,
jdk11,
libtool,
libuuid,
mesa_glu,
openalSoft,
python27Packages,
rpm,
valgrind,
waf,
xorgproto,
xvfb_run,
libXi,
libXext,
}:

let
  inherit (python27Packages) python;
in stdenv.mkDerivation rec {
  pname = "defold";
  version = "1.2.172";
 
  src = fetchFromGitHub {
    owner = "defold";
    repo = "defold";
    rev = "1.2.172";
    sha256 = "0knjjvcc34c6b35vcsjzmxckaxx2dskbdhaawia7dqw4qysr8pld";
  };

  buildPhase = ''
    chmod +x ./scripts/build.py
    ./scripts/build.py shell --platform=${stdenv.system}
    ./scripts/build.py install_ext --platform=${stdenv.system}
    ./scripts/build.py build_engine --platform=${stdenv.system}
  '';

  enableParallelBuilding = true;
  doCheck = true;

  meta = with stdenv.lib; {
    broken = true;
    description = "A free and open-source game engine for cross-platform development.";
    homepage = "https://defold.com/";
    license = licenses.free;
    maintainers = [ maintainers.foo-dogsquared ];
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
