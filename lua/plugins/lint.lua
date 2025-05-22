return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost" },
	config = function()
		local langtools = require("config.langutil")
		local lint = require("lint")

		lint.linters_by_ft = langtools.get("lint")

		-- Run linter on save
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
