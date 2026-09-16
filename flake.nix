{
  description = "Ren'Py Universal Translator Mod — development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          renpy
          git
        ];

        shellHook = ''
          echo "=== Ren'Py Translator Mod Development Environment ==="
          echo ""
          echo "Ren'Py: $(renpy --version 2>/dev/null || echo 'check nixpkgs')"
          echo ""
        '';
      };
    };
}
