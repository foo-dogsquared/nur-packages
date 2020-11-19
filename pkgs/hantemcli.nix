{ stdenv, fetchgit, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "hantemcli";
  version = "0.3.0";

  src = fetchgit {
    url = "https://github.com/foo-dogsquared/hantemcli";
    rev = "v${version}";
    sha256 = "sha256-jUSjcxL3DPa/F9gsx7fGNeqeGlZB+rpusulqmTBUgj0=";
  };

  cargoSha256 = "sha256-h+ka8lI3TtBJBGaPzyz9wRFTHDShP34gw7Rtg6ihJ/w=";

  meta = with stdenv.lib; {
    description =
      "Command-line tool to render Handlebars templates with data files.";
    homepage = "https://github.com/foo-dogsquared/hantemcli";
    license = licenses.mit;
    maintainers = with maintainers; [ foo-dogsquared ];
  };
}

