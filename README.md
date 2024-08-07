# redowheel's NixOS flake configurations.

## Features:
+ Modular structure.
+ Has pre wallpapers in it (util/prewallpapers).
+ Has script named xbgfill made by me for setting wallpaper.
+ i3 and i3-status-rust configuration is configured Nix way, using Home-Manager; totally works out of the box.
+ Has own Neovim distro Powered by NixVim, can be run via following commands (aliases); vi - vim - nvim.
+ Can create an iso of the configuration, -> because of there is no configuration outside of the pure Nix* files, you can even make your own iso.
+ Has multiple flake configurations office/gaming.
+ Even partition configurations configured nix-way via Disko.

## To install:
+ Firstly, run Disko to create partitions, instructions can be found in ./nixos/Disko-README.md file.
+ Finally run ``sudo nixos-install --flake $(path_of_dotfiles)#configurationName``.

## To rebuild-switch:
+ ```sudo nixos-rebuild switch --flake $(path_of_dotfiles)#configurationName```
+ ```sudo nixos-rebuild switch --flake $(path_of_dotfiles)#configurationName --no-write-lock-file```

## To create iso:
```nix build $(path_of_dotfiles)#nixosConfigurations.iso.config.system.build.isoImage``` TODO: Fix it.

## Notes:
+ "nix-channel" command and channels are disabled because there is no need for this but you can enable using
removing "channel.enable = false" line in system.nix.
+ To run i3wm, you can use "xsession" custom command.
+ My flake configuration is made for my computer so I can't really say this will work on another computer.
