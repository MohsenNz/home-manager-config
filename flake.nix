{
  description = "Home Manager configuration of mohsen";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-2311.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixpkgs-2311, ... }:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs-2311 = nixpkgs-2311.legacyPackages.${system};
      ld_library_path2311 = "${pkgs-2311.stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (_final: _prev: {
            lunarvim = pkgs-2311.lunarvim.overrideAttrs (_oldAttrs: {
              postInstall = ''
                wrapProgram $out/bin/lvim --prefix LD_LIBRARY_PATH : "${ld_library_path2311}"
              '';
            });
          })
        ];
      };
    in
    {
      homeConfigurations."mohsen" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
