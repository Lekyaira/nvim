-- Set the colorscheme
local function i()
	vim.cmd.colorscheme "catppuccin-mocha";
end

return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000, 
  opts = {
	  flavor = "mocha",
	  transparent_background = true,
	  show_end_of_buffer = false,
  },
  init = i, -- Set the colorscheme
}
