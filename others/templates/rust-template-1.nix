{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
	name = "*** CHANGE HERE ***";

	buildInputs = [
		pkgs.rustc
		pkgs.cargo
		pkgs.clippy
		pkgs.rustfmt
		pkgs.rust-analyzer
	];

	packages = [];

	shellHook = ''
		echo "Start developing..."
	'';
}
