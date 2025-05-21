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
	}
}
