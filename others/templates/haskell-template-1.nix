{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
	name = "*** CHANGE HERE ***";

	buildInputs = [
		pkgs.ghc
		pkgs.cabal-install
		pkgs.haskell-language-server
	];

	packages = with pkgs; [
		cloc
	];

	shellHook = ''
		echo "Start developing..."
	'';
}
