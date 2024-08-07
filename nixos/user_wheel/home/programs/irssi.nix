let nickname = "ircenjoyer"; in {
	programs.irssi = {
		enable = true;

		aliases = {
			q = "quit";
			j = "join";
		};

		networks = {
			liberachat = {
				nick = "${nickname}";
				server = {
					address = "irc.libera.chat";
					port = 6697;
					autoConnect = true;
				};
			};

			oftc = {
				nick = "${nickname}";
				server = {
					address = "irc.oftc.net";
					port = 6697;
				};
			};
		};
	};
}
