return {
	lua = {
		lsp = "lua_ls",
		mason = "lua_ls",
		treesitter = true,
		format = "stylua",
		lint = "luacheck",
		mason_lint = "luacheck",
	},

	python = {
		lsp = "pyright",
		mason = "pyright",
		treesitter = true,
		format = "black",
		lint = "ruff",
		mason_lint = "ruff",
	},

	javascript = {
		lsp = "tsserver",
		mason = "eslint",
		treesitter = true,
		format = "prettier",
		lint = "eslint_d",
		mason_lint = "eslint_d",
	},

	typescript = {
		lsp = "tsserver",
		mason = false, -- already handled by javascript
		treesitter = true,
		format = "prettier",
		lint = "eslint_d",
		mason_lint = false,
	},

	json = {
		lsp = "jsonls",
		mason = "jsonls",
		treesitter = true,
		format = "prettier",
		lint = false,
		mason_lint = false,
	},

	yaml = {
		lsp = "yamlls",
		mason = "yamlls",
		treesitter = true,
		format = "prettier",
		lint = false,
		mason_lint = false,
	},

	markdown = {
		lsp = "marksman",
		mason = "marksman",
		treesitter = true,
		format = "prettier",
		lint = false,
		mason_lint = false,
	},

	html = {
		lsp = "html",
		mason = "html",
		treesitter = true,
		format = "prettier",
		lint = false,
		mason_lint = false,
	},

	css = {
		lsp = "cssls",
		mason = "cssls",
		treesitter = true,
		format = "prettier",
		lint = false,
		mason_lint = false,
	},

	scss = {
		lsp = "cssls",
		mason = false,
		treesitter = true,
		format = "prettier",
		lint = false,
		mason_lint = false,
	},

	toml = {
		lsp = "taplo",
		mason = "taplo",
		treesitter = true,
		format = false,
		lint = false,
		mason_lint = false,
	},

	bash = {
		lsp = "bashls",
		mason = "bashls",
		treesitter = true,
		format = false,
		lint = "shellcheck",
		mason_lint = "shellcheck",
	},

	c = {
		lsp = "clangd",
		mason = "clangd",
		treesitter = true,
		format = false,
		lint = false,
		mason_lint = false,
	},

	cpp = {
		lsp = "clangd",
		mason = false,
		treesitter = true,
		format = false,
		lint = false,
		mason_lint = false,
	},

	rust = {
		lsp = false, -- handled by rustaceanvim
		mason = false,
		treesitter = true,
		format = "rustfmt",
		lint = false,
		mason_lint = false,
	},

	nu = {
		lsp = "nu_ls",
		mason = false,
		treesitter = true,
		format = false,
		lint = false,
		mason_lint = false,
	},
}
