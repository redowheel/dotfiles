let inherit (import ../../variables.nix) username; in {
	programs.thunderbird = {
		enable = true;
		profiles.${username} = {
			isDefault = true;
		};
	};
}
