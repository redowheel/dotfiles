{
	description = "redowheel's NixOS Flake configuration.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-index-database = {
			url = "github:nix-community/nix-index-database";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim/nixos-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
  		};
	};
	
	outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, nix-index-database, nixvim, ... }: let
		inherit (import ./nixos/user_wheel/variables.nix) username systemarch;

		defaultModules = [
			./nixos/user_${username}/system

			nix-index-database.nixosModules.nix-index {
				programs.nix-index-database.comma.enable = true;
			}

			({ ... }: let overlay-unstable = final: prev: {
				unstable = import nixpkgs-unstable {
					system = final.system;
					config.allowUnfree = true;
				};
			}; in {
				nixpkgs.overlays = [ overlay-unstable ];
			})

			home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.sharedModules = [
					nixvim.homeManagerModules.nixvim
				];
				home-manager.users.${username} = import ./nixos/user_${username}/home;
			}
		];
	in {
		nixosConfigurations = {
			monster-office = nixpkgs.lib.nixosSystem {
				system = "${systemarch}";
				modules = defaultModules ++ [ ./nixos/hosts/monster-notebook/office ];
			};

			monster-gaming = nixpkgs.lib.nixosSystem {
				system = "${systemarch}";
				modules = defaultModules ++ [ ./nixos/hosts/monster-notebook/gaming ];
			};
		};
	};
}
