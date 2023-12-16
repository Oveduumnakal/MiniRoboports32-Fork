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
          name = "MiniRoboports32";
          src = ./src;
          version = "1.0.0";
        

          buildInputs = [ pkgs.zip ];

          buildPhase = ''
            mkdir ${name}
            shopt -s extglob
            mv -- !(${name}) ${name}
            zip -r ${name}_${version}.zip ./${name} -x '*.xcf'
          '';

          installPhase = ''
            mkdir -p $out
            cp ${name}_${version}.zip $out
          '';

        };
      };
    };
  };
}
