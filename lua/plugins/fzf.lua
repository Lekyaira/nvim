return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Find File" },
		{ "<leader>fp", function() require("fzf-lua").live_grep() end, desc = "Find in Project" },
		{ 
			"<leader>fc", 
			function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, 
			desc = "Find in Neovim Configuratin" 
		},
	}
}
