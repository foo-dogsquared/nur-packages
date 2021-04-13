{ stdenv, fetchgit, buildGoModule }:

buildGoModule rec {
  pname = "openring";
  version = "af9038b5";

  src = fetchgit {
    url = "https://git.sr.ht/~sircmpwn/openring";
    rev = "af9038b5bbf8d0bac9f401ccab263990df900dab";
    sha256 = "1r8vnqbsrjrafva12v5cbv4229qsx7z5lp19zhqzky9chais4c9k";
  };

  vendorSha256 = "sha256-BbBTmkGyLrIWphXC+dBaHaVzHuXRZ+4N/Jt2k3nF7Z4=";

  subPackages = [ "." ];

  meta = with stdenv.lib; {
    description = "Tool for generating a webring from a list of RSS feeds.";
    homepage = "https://git.sr.ht/~sircmpwn/openring";
    license = licenses.gpl3;
  };
}
