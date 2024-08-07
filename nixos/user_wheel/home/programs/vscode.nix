{ pkgs, ... }: {
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;

		extensions = with pkgs.vscode-extensions; [
			mkhl.direnv
			ms-vscode.hexeditor
			james-yu.latex-workshop

			rust-lang.rust-analyzer

			twxs.cmake
			ms-vscode.cpptools
			ms-vscode.cmake-tools
			ms-vscode.makefile-tools
			llvm-vs-code-extensions.vscode-clangd

			redhat.java
			vscjava.vscode-maven
			vscjava.vscode-java-test
			vscjava.vscode-java-debug
			vscjava.vscode-java-dependency
			visualstudioexptteam.vscodeintellicode
    	];
	};
}
