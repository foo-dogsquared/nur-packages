{ stdenv, lib, fetchgit, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "hantemcli";
  version = "0.3.0";

  src = fetchgit {
    url = "https://github.com/foo-dogsquared/hantemcli";
    rev = "v${version}";
    sha256 = "sha256:jUSjcxL3DPa/F9gsx7fGNeqeGlZB+rpusulqmTBUgj0=";
  };

  cargoHash = "sha256:0c3zlschzpx8mq9c62g50mqwy4zz9mcck52bdwf446x8jzsifp02";

  meta = with lib; {
    description =
      "Command-line tool to render Handlebars templates with data files.";
    homepage = "https://github.com/foo-dogsquared/hantemcli";
    license = licenses.mit;
  };
}

