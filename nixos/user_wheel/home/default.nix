{ pkgs, ... }: {
	imports = [
		./others
		./programs
		./services
	];

	home.stateVersion = "24.05";

	home.packages = with pkgs; [
		(import ./scripts/xbgfill.nix { inherit pkgs; })
		(import ./scripts/xsession.nix { inherit pkgs; })

		xfce.mousepad
		xfce.xfce4-clipman-plugin

		(xfce.thunar.override {
			thunarPlugins = [
				xfce.thunar-volman
				xfce.thunar-archive-plugin
				xfce.thunar-media-tags-plugin
			];
		})

		scrot
		ani-cli
		neofetch
		gnome.file-roller

		dunst
		brightnessctl
		networkmanagerapplet
		gnome.gnome-disk-utility
   	];
}
