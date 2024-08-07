{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
	name = "*** CHANGE HERE ***";

	buildInputs = [
		pkgs.gcc
		pkgs.cmake
		pkgs.clang-tools
	];

	packages = with pkgs; [
		cloc
	];

	shellHook = ''
		echo "Start developing..."
	'';
}
