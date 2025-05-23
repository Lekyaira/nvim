-- ~/.config/nvim/lua/plugins/lsp.lua

return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Autocomplete
			{ "ms-jpq/coq_nvim",       branch = "coq" },

			-- 9000+ Snippets
			{ "ms-jpq/coq.artifacts",  branch = "artifacts" },

			-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
			-- Need to **configure separately**
			{ 'ms-jpq/coq.thirdparty', branch = "3p" }
			-- - shell repl
			-- - nvim lua api
			-- - scientific calculator
			-- - comment banner
			-- - etc
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true, -- if you want to start COQ at startup
				-- Your COQ settings here
			}
		end,
		config = function()
			local langtools = require("config.langutil")
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local coq = require("coq")

			-- LSP Keybindings (with fzf-lua)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
				callback = function(event)
					-- Set up languages
					for server, settings in langtools.get("lsp") do
						vim.lsp.config(server, coq.lsp_ensure_capabilities(settings))
					end

					-- Set up keymaps
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- fzf-lua-based navigation
					local fzf = require("fzf-lua")
					map("gd", fzf.lsp_definitions, "Go to Definition")
					map("gi", fzf.lsp_implementations, "Go to Implementation")
					map("gr", fzf.lsp_references, "Go to References")
					map("<leader>ds", fzf.lsp_document_symbols, "Document Symbols")
					map("<leader>ws", fzf.lsp_live_workspace_symbols, "Workspace Symbols")
					map("<leader>D", fzf.lsp_typedefs, "Go to Type Definition")

					-- Standard LSP functions
					map("gD", vim.lsp.buf.declaration, "Go to Declaration")
					map("K", vim.lsp.buf.hover, "Hover Info")
					map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, "Format Buffer")

					-- Diagnostics
					map("gl", vim.diagnostic.open_float, "Line Diagnostics")
					map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
					map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
				end,
			})
		end,
	},
}
