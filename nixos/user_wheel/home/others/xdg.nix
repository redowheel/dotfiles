{
	xdg = {
		enable = true;

		userDirs = {
			enable = true;
			createDirectories = true;
		};

		mimeApps = {
			enable = true;
			defaultApplications = {
				"application/pdf" = [ "firefox.desktop" ];
				"text/plain" = [ "org.xfce.mousepad.desktop" ];
				"application/x-web-browser" = [ "firefox.desktop" ];
				"x-scheme-handler/terminal" = [ "Alacritty.desktop" ];
				"compressed/archives" = [ "org.gnome.FileRoller.desktop" ];
			};
		};
	};
}
