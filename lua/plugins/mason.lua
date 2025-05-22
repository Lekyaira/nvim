return {
	{
		"williamboman/mason.nvim",
		build = { ":MasonUpdate", ":MasonInstallAll" },
		config = true,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		lazy = false,
		priority = 1000,
		config = function()
			local langtools = require("config.langutil")
			require("mason-tool-installer").setup({
				ensure_installed = langtools.get({ "mason", "format", "mason_lint" }),
			})
		end,
	},
}
