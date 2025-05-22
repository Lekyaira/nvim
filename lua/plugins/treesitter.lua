-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local langtools = require("config.langutil")

		require("nvim-treesitter.configs").setup({
			ensure_installed = langtools.get("treesitter"),
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
