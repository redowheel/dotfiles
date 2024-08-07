let
	lock-false = { Value = false; Status = "locked"; };
	lock-true = { Value = true; Status = "locked"; };
	inherit (import ../../variables.nix) username;
in
{
	programs.firefox = {
		enable = true;

		profiles.${username}.bookmarks = [
			{ name = "Wikipedia"; tags = [ "wiki" ]; keyword = "wiki"; url = "https://en.wikipedia.org/"; }
			{ name = "YouTube"; tags = [ "youtube" "yt" "video" ]; keyword = "yt"; url = "https://www.youtube.com/"; }

			{
				name = "Archive.org";
				bookmarks = [
					{ name = "archive.org"; tags = [ "archive" ]; url = "https://archive.org/"; }
					{ name = "Wayback Machine"; tags = [ "archive" "waybackmachine" ]; url = "https://wayback-api.archive.org/"; }
				];
			}

  			{
				name = "Development and Linux";
				bookmarks = [
					{ name = "cppreference.com"; tags = [ "cpp" ]; url = "https://cppreference.com/"; }
					{ name = "OSdev.org Wiki"; tags = [ "wiki" "osdev" ]; url = "https://wiki.osdev.org/"; }
					{ name = "OSDev.org Forum"; tags = [ "forum" "osdev" ]; url = "https://forum.osdev.org/"; }
					{ name = "The Linux Kernel Archives"; tags = [ "archive" "linux" ]; url = "https://kernel.org/"; }
				];
  			}

			{
				name = "Mail";
				bookmarks = [
					{ name = "Proton"; tags = [ "mail" "proton" ]; url = "https://mail.proton.me/"; }
				];
			}

			{
				name = "GitX";
				bookmarks = [
					{ name = "GitHub"; tags = [ "git" "github" ]; url = "https://github.com/"; }
					{ name = "GitLab"; tags = [ "git" "gitlab" ]; url = "https://gitlab.com/"; }
					{ name = "Git and SSH usage."; tags = [ "ssh" "git" ]; url = "https://gist.github.com/xirixiz/b6b0c6f4917ce17a90e00f9b60566278"; }
				];
			}

			{
				name = "NixOS";
				bookmarks = [
					{ name = "homepage"; url = "https://nixos.org/"; }
					{ name = "search"; tags = [ "search" "nix" ]; url = "https://search.nixos.org/"; }
					{ name = "home manager options-search"; tags = [ "search" "hm" "nix" ]; url = "https://home-manager-options.extranix.com/"; }
					{ name = "discourse"; tags = [ "forum" "nix" ]; url = "https://discourse.nixos.org/"; }
					{ name = "wiki"; tags = [ "wiki" "nix" ]; url = "https://wiki.nixos.org/"; }
				];
			}
		];

		/* ---- POLICIES ---- */
		# Check about:policies#documentation for options.
		policies = {
			DisableTelemetry = true;
			DisableFirefoxStudies = true;
			EnableTrackingProtection = {
				Value= true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};
			DisablePocket = true;
			DisableFirefoxAccounts = true;
			DisableAccounts = true;
			DisableFirefoxScreenshots = true;
			OverrideFirstRunPage = "";
			OverridePostUpdatePage = "";
			DontCheckDefaultBrowser = true;
			DisplayBookmarksToolbar = "never";
			DisplayMenuBar = "default-off";
			SearchBar = "unified";

			ExtensionSettings = {
				"*".installation_mode = "blocked"; # blocks all addons except the ones specified below

				"uBlock0@raymondhill.net" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
					installation_mode = "force_installed";
				};

				"jid1-MnnxcxisBPnSXQ@jetpack" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
					installation_mode = "force_installed";
				};

				"simple-translate@sienori" = {
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/simple-translate/latest.xpi";
					installation_mode = "force_installed";
				};
			};

			Preferences = { 
				"browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
				"extensions.pocket.enabled" = lock-false;
				"extensions.screenshots.disabled" = lock-true;
				"browser.topsites.contile.enabled" = lock-false;
				"browser.formfill.enable" = lock-false;
				"browser.search.suggest.enabled.private" = lock-false;
				"browser.urlbar.showSearchSuggestionsFirst" = lock-false;
				"browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
				"browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
				"browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
				"browser.newtabpage.activity-stream.showSponsored" = lock-false;
				"browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
				"browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
				"browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
				"browser.sessionstore.restore_on_startup" = lock-true;
				"browser.startup.page" = 3;
				"network.trr.mode" = 2;
			};
		};
	};
}
