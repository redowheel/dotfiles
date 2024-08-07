{ pkgs, ... }: let
	inherit (import ../../variables.nix) username;
	xsession_path = "/home/${username}/.xsession";
in {
	services.xserver = {
		enable = true;
		excludePackages = with pkgs; [ xterm ];

		displayManager = {
			startx.enable = true;

			session = [
				{
					manage = "desktop";
					name = "xsession";
					start = ''exec ${xsession_path}'';
				}
			];
		};
	};

	services.displayManager = {
		defaultSession = "xsession"; # home-manager generated session file.
	};
}
