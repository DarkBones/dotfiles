{
  description = "Zsh sandbox for testing new config";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs;[ zsh git fd ripgrep fzf neofetch watchexec ];

        shellHook = ''
          export ZDOTDIR="$PWD/zsh" # TODO: Change to $HOME
        '';
      };
    };
}
