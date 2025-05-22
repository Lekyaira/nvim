return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local langtools = require("config.langutil")
		require("conform").setup({
			formatters_by_ft = langtools.get("format"),
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
			notify_on_error = true,
		})
	end,
}
