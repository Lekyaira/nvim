-- Let Lazy handle setup
local function i()
	vim.g.barbar_auto_setup = false
end

return {
	"romgrk/barbar.nvim",
	version = "^1.0.0",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- Git status
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		auto_hide = 1,
		icons = {
			button = "",
			separator = { left = "|", right = "" },
			modified = { button = "" },
		},
		no_name_title = "Empty",
	},
	init = i, -- Let Lazy handle setup
	keys = {
		{ "<C-s>", [[:BufferPrevious<CR>]] },
		{ "<C-t>", [[:BufferNext<CR>]] },
		{ "<C-S-s>", [[:BufferMovePrevious<CR>]] },
		{ "<C-S-t>", [[:BufferMoveNext<CR>]] },
		{ "<leader>p", [[:BufferPin<CR>]], desc = "Pin/Unpin Current Buffer" },
		{ "<leader>x", [[:SmartBdelete<CR>]], desc = "Close Current Buffer" },
	},
}
