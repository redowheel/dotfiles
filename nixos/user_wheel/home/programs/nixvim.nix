{
	programs.ripgrep.enable = true;

	programs.nixvim = {
		enable = true;

		globals = {
			mapleader = " ";
			
			loaded_ruby_provider = 0;
			loaded_perl_provider = 0; 
	  		loaded_python_provider = 0;
		};

		clipboard = {
			register = "unnamedplus";
			providers.xclip.enable = true;
		};

		opts = {
			number = true;
			autoindent = true;

			tabstop = 4;
			shiftwidth = 4;

			swapfile = false;
			termguicolors = true;
		};

		colorschemes = {
			tokyonight.enable = true;
		};

		plugins = {
			lualine.enable = true;
			bufferline.enable = true;

			nvim-tree.enable = true;
			toggleterm.enable = true;

			which-key.enable = true;
			treesitter.enable = true;

			surround.enable = true;
			nvim-autopairs.enable = true;

			direnv.enable = true;
			luasnip.enable = true;
			cmp_luasnip.enable = true;

			lsp = {
				enable = true;
				servers = {
					nixd.enable = true; # Nix
					hls = { enable = true; package = null; };
					clangd = { enable = true; package = null; };
					ocamllsp = { enable = true; package = null; };
					rust-analyzer = { enable = true; package = null; installRustc = false; installCargo = false; };
				};
			};

			dap = {
				enable = true;

				adapters.executables = {
					gdb = { args = [ "-i" "dap" ]; command = "gdb"; };
				};

				configurations = {
					#cpp = [{ name = "Launch"; type = "gdb"; request = "launch"; }];
					# configurations currently doesent work acording to my experience so should be done in "extraConfigLua" section.
				};
			};

			cmp = {
				enable = true;
				autoEnableSources = true;

				settings = {
					snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

			    	sources = [
            			{ name = "path"; }
						{ name = "nvim_lsp"; }
            			{ name = "luasnip"; }
            			{ name = "buffer"; option.get_bufnrs.__raw = "vim.api.nvim_list_bufs"; }
          			];
					
					menu = {
						path = "[path]";
						nvim_lsp = "[LSP]";
						luasnip = "[snip]";
						buffer = "[buffer]";
					};

					mapping = {
						"<CR>" = "cmp.mapping.confirm({ select = true })";
						"<Tab>" = ''
							function(fallback)
								if cmp.visible() then
									cmp.select_next_item()
								elseif require("luasnip").expand_or_jumpable() then
									vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
								else
									fallback()
								end
							end
						'';
					};
				};
			};

			telescope = {
				enable = true;
				keymaps = {
					"<leader>ff" = { options.desc = "Find files via Telescope.nvim."; action = "find_files"; };
					"<leader>fg" = { options.desc = "Find text/files via ripgrep and Telescope.nvim."; action = "live_grep"; };
					"<leader>fb" = { options.desc = "Find buffers via Telescope.nvim."; action = "buffers"; };
					"<leader>fh" = { options.desc = "Find help tags via Telescope.nvim"; action = "help_tags"; };
				};
			};
		};

		keymaps = [
			{ mode = "n"; key = "<leader>n"; options.silent = true; action = "<cmd>NvimTreeToggle<cr>"; options.desc = "Open file browser. (NvimTree)"; }
			{ mode = "n"; key = "<leader>t"; options.silent = true; action = "<cmd>ToggleTerm<cr>"; options.desc = "Open the tiling terminal. (ToggleTerm)"; }

			{ mode = "n"; key = "<leader>cf"; options.silent = true; action = "<cmd>lua vim.lsp.buf.format()<cr>"; options.desc = "Format the code via LSP."; }

			{ mode = "n"; key = "<leader>db"; options.silent = true; action = "<cmd>DapToggleBreakpoint<cr>"; options.desc = "Put or remove a Breakpoint. (DAP)"; }
			{ mode = "n"; key = "<leader>dr"; options.silent = true; action = "<cmd>DapContinue<cr>"; options.desc = "Start debugging. (DAP)"; }
		];
	};
}
