# Disko Configuration README.md

### To start creating partitions.
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko $(PATH_OF_YOUR_CONFIG_FILE.nix)

### Disko config files can be found in ../hosts/*/ directory. Every host has it's own scheme.
