# The nixpkgs of Julia is not yet successfully updated (or even built).
# See https://github.com/NixOS/nixpkgs/issues/91930 and https://github.com/NixOS/nixpkgs/pull/98042 to know the status of how Julia is built on the package set.
# For now, I'll be packaging the binary since compilation is too long.
{ stdenv, fetchurl, autoPatchelfHook }:

stdenv.mkDerivation rec {
  pname = "julia-bin";
  version = "1.5.2";

  src = fetchurl {
    url =
      "https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.2-linux-x86_64.tar.gz";
    sha256 = "sha256-bacE+tzvo5clUD5Mepz6GlcLqKZHxL2N5poRj0NYRjA=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  installPhase = ''
    mkdir $out
    cp -R * $out/
  '';

  meta = with stdenv.lib; {
    description = "The binary build for Julia 1.5 on 64-bit Linux systems.";
    homepage = "https://julialang.org/";
    license = licenses.free;
    platforms = [ "x86_64-linux" ];
  };
}
