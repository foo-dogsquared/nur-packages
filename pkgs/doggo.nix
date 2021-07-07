{ stdenv
, lib
, fetchFromGitHub
, buildGoModule
, installShellFiles
}:

buildGoModule rec {
  pname = "doggo";
  version = "0.4.0";

  subPackages = [ "cmd/doggo/cli" "cmd/doggo/api" ];

  src = fetchFromGitHub {
    owner = "mr-karan";
    repo = "doggo";
    rev = "v${version}";
    sha256 = "sha256:1k3qhlb7dq1gbysm9q77x1p99lqdn6f723n3p5gzm0ii0dk19ni7";
  };

  nativeBuildInputs = [ installShellFiles ];

  vendorSha256 = "sha256:1ri1dybp7brzbhm1x142yhv1m9wsnf4v19wp6fviqr2l5vnbr825";

  ldFlags = [
    "-X main.buildVersion=${version}"
    "-X main.buildDate=$(date '+%Y-%m-%d %H:%M:%S')"
  ];

  postInstall = ''
    # The binary names come from the Makefile only without the '.bin. extension.
    mv $out/bin/{cli,doggo}
    mv $out/bin/{api,doggo-api}

    installShellCompletion completions/doggo.{fish,zsh}
  '';

  meta = with lib; {
    description = "HTTP DNS client for humans.";
    homepage = "https://github.com/mr-karan/doggo";
    license = licenses.mit;
  };
}
