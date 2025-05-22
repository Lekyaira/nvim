k = require("config.keyhelpers")

-- Set up keymap overrides
local function kmap(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { 
			desc = "nvim-tree: " .. desc, 
			buffer = bufnr, 
			noremap = true, 
			silent = true, 
			nowait = true,
		}
	end

	-- Default mappings
	k.n("?", api.tree.toggle_help, opts("Help"))
	k.n("h", api.node.navigate.parent, opts("Parent"))
	k.n("i", api.node.open.edit, opts("Open"))
	k.n("n", "j", opts "Next")
	k.n("e", "k", opts "Previous")
	k.n("r", api.fs.rename, opts("Rename"))
	k.n("a", api.fs.create, opts("Add"))
	k.n("d", api.fs.remove, opts("Delete"))
	k.n("x", api.fs.cut, opts("Cut"))
	k.n("p", api.fs.paste, opts("Paste"))
end

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		on_attach = kmap,
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	},
	keys = {
		{ "<leader>e", [[:NvimTreeToggle<CR>]], desc = "File Explorer" }
	},
}
