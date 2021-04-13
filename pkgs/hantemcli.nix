{ stdenv, lib, fetchgit, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "hantemcli";
  version = "0.3.0";

  src = fetchgit {
    url = "https://github.com/foo-dogsquared/hantemcli";
    rev = "v${version}";
    sha256 = "sha256-jUSjcxL3DPa/F9gsx7fGNeqeGlZB+rpusulqmTBUgj0=";
  };

  cargoHash = "sha256:1z17l6l86vdlqch7wgx16hf564f1zlncz3v60i4x0kipabr1msc7";

  meta = with lib; {
    description =
      "Command-line tool to render Handlebars templates with data files.";
    homepage = "https://github.com/foo-dogsquared/hantemcli";
    license = licenses.mit;
  };
}

