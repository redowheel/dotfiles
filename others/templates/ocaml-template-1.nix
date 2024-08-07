{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
	name = "*** CHANGE HERE ***";

	buildInputs = [
	] ++ ( with pkgs.ocamlPackages; [
			odoc
			utop
			ocaml
			merlin
			dune_3
			findlib
			ocaml-lsp
			ocp-indent
			ocamlformat
		]
	);

	packages = with pkgs; [
		cloc
	];

	shellHook = ''
		echo "Start developing..."
	'';
}
