{
  description = "Nix flake for solving Vinteum challenges";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
      ];

      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          # The Nix packages provided in the environment
          # Add any you need here
          packages = with pkgs; [ jq bitcoin ];

          # Set any environment variables for your dev shell
          env = {
            CRPC_USER = "user_094";
            CRPC_PASSWORD = "GGODihZjUDJe";
            CRPC_IP = "84.247.182.145";
          };

          shellHook = ''
              echo "Cypherpunks write code!"
              rm -rf ~/.bitcoin/bitcoin.conf
              touch ~/.bitcoin/bitcoin.conf
              echo "rpcconnect=84.247.182.145" >> ~/.bitcoin/bitcoin.conf
              echo "rpcuser=classroom" >> ~/.bitcoin/bitcoin.conf
              echo "rpcpassword=R4uo1NgQGuFx" >> ~/.bitcoin/bitcoin.conf
          '';
        };
      });
    };
}
