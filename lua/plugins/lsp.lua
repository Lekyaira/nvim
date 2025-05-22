-- ~/.config/nvim/lua/plugins/lsp.lua

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local langtools = require("config.langutil")
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = langtools.get("mason"),
				handlers = {
					function(server_name)
						local cfg = langtools.get_lsp_config_by_server(server_name)
						if cfg then
							lspconfig[server_name].setup({
								capabilities = require("cmp_nvim_lsp").default_capabilities(),
								settings = cfg.settings or {},
							})
						end
					end,
				},
			})

			-- LSP Keybindings (with fzf-lua)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
				callback = function(event)
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
