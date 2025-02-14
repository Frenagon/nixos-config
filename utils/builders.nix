inputs: let
  nixpkgs = inputs.nixpkgs;
  home-manager = inputs.home-manager;
in {
  mkSystem = cfg:
    nixpkgs.lib.nixosSystem (
      with cfg; let
        specialArgs = {
          inherit inputs;
        };
      in {
        inherit system specialArgs;
        modules =
          [
            config
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = {
                imports = cfg.homeModules;
              };
            }
          ]
          ++ cfg.modules;
      }
    );

  mkHome = cfg:
    home-manager.lib.homeManagerConfiguration (
      with cfg; {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {inherit inputs;};
        modules = cfg.modules;
      }
    );
}
