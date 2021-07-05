{ stdenv
, lib
, fetchFromGitHub
, buildGoModule
}:

buildGoModule rec {
  pname = "awesome-cli";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "umutphp";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = "sha256:0yy73mbdmrga9f9k88bsmip9jdg0px0j6fxa8r3c4zslc2n2dqvs";
  };

  vendorSha256 = "sha256:1pa8h8h1asx9cn6dmi4gwbdlmr628swd8fyi4blz5ndjhncdravf";

  meta = with lib; {
    description = "A simple command tool to dive into fancy awesome lists.";
    homepage = "https://github.com/umutphp/awesome-cli";
    license = licenses.mit;
  };
}
