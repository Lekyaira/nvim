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
		{ "<leader>fb", function() require("fzf-lua").builtin() end, desc = "Find in Help" },
		{ "<leader>fh", function() require("fzf-lua").helptags() end, desc = "Find in Help" },
		{ "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Find in Keymaps" },
		{ "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Find Word" },
		{ "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "Find WORD" },
		{ "<leader>fr", function() require("fzf-lua").resume() end, desc = "Resume Find" },
		{ 
			"<leader><leader>", 
			function() require("fzf-lua").buffers() end, 
			desc = "Open Current Buffers" 
		},
		{ "<leader>/", function() require("fzf-lua").lgrep_curbuf() end, desc = "Find in Buffer" },
	}
}
