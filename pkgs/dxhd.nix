{ stdenv, fetchgit, buildGoModule }:

buildGoModule rec {
  pname = "dxhd";
  version = "30.10.2020_16.02";

  src = fetchgit {
    url = "https://github.com/dakyskye/dxhd.git";
    rev = "${version}";
    sha256 = "sha256-5OaXGaz52Duc8EmyJzHyK4OfULlWw0L2yygH/RYK5y4=";
  };

  vendorSha256 = "sha256-yL18s5n5PMo/oqjJ8jT6k/dm3AB9kIGX8Oa+TU06cI0=";

  subPackages = [ "." ];

  meta = with stdenv.lib; {
    description = "Hotkey daemon inspired from SXHKD featuring more elegant syntax.";
    homepage = "https://github.com/dakyskye/dxhd";
    license = licenses.mit;
  };
}
