{ pkgs, ... }: {
	programs.mpv = {
		enable = true;

		scripts = with pkgs; [
			mpvScripts.uosc
			mpvScripts.mpv-slicing
			mpvScripts.mpv-playlistmanager
		];
	};
}
