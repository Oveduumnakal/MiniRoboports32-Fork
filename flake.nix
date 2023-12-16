{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { self, nixpkgs, flake-parts }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    perSystem = { pkgs, system, ... }: {

      devShells = {
        default = pkgs.mkShell {
          packages = pkgs.zip;
        };
      };

      packages = {
        default = pkgs.stdenv.mkDerivation rec {
          name = "mini-roboports-32";
          src = ./src;
          version = "1.0.0";

          buildInputs = [ pkgs.zip ];

          buildPhase = ''
            zip -r MiniRoboports32_${version}.zip \
            	thumbnail.png \
            	data.lua \
            	info.json \
            	locale \
            	graphics \
            	prototypes \
            	-x '*.xcf'
          '';

          installPhase = ''
            mkdir -p $out
            cp MiniRoboports32_${version}.zip $out
          '';

        };
      };
    };
  };
}
