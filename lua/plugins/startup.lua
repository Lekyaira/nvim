local function i()
	local alpha = require "alpha"
	local dashboard = require "alpha.themes.dashboard"
	dashboard.section.header.val = {
[[	⠀⠀⠀⠀⣀⡀																												 ]],
[[	⠀⠀⠀⠀⣿⠙⣦⠀⠀⠀⠀⠀⠀⣀⣤⡶⠛⠁																								 ]],
[[	⠀⠀⠀⠀⢻⠀⠈⠳⠀⠀⣀⣴⡾⠛⠁⣠⠂⢠⠇																								 ]],
[[	⠀⠀⠀⠀⠈⢀⣀⠤⢤⡶⠟⠁⢀⣴⣟⠀⠀⣾		   																					 ]],
[[	⠀⠀⠀⠠⠞⠉⢁⠀⠉⠀⢀⣠⣾⣿⣏⠀⢠⡇																								 ]],
[[	⠀⠀⡰⠋⠀⢰⠃⠀⠀⠉⠛⠿⠿⠏⠁⠀⣸⠁				NN    NN  EEEEEEEE    OOOO    VV      VV  IIIIIIII  MM     MM]],
[[	⠀⠀⣄⠀⠀⠏⣤⣤⣀⡀⠀⠀⠀⠀⠀⠾⢯⣀				NNN   NN  EEEEEEEE   OO  OO   VV      VV  IIIIIIII  MMM   MMM]],
[[	⠀⠀⣻⠃⠀⣰⡿⠛⠁⠀⠀⠀⢤⣀⡀⠀⠺⣿⡟⠛⠁			NNNN  NN  EE        OO    OO  VV      VV     II     MMMM MMMM]],
[[	⠀⡠⠋⡤⠠⠋⠀⠀⢀⠐⠁⠀⠈⣙⢯⡃⠀⢈⡻⣦				NN NN	NN  EEEEE     OO    OO  VV      VV     II     MM MMM MM]],
[[	⢰⣷⠇⠀⠀⠀⢀⡠⠃⠀⠀⠀⠀⠈⠻⢯⡄⠀⢻⣿⣷			NN  NNNN  EE        OO    OO   VV    VV      II     MM  M  MM]],
[[	⠀⠉⠲⣶⣶⢾⣉⣐⡚⠋⠀⠀⠀⠀⠀⠘⠀⠀⡎⣿⣿⡇			NN   NNN  EEEEEEEE   OO  OO     VV  VV    IIIIIIII  MM     MM]],
[[	⠀⠀⠀⠀⠀⣸⣿⣿⣿⣷⡄⠀⠀⢠⣿⣴⠀⠀⣿⣿⣿⣧			NN    NN  EEEEEEEE    OOOO        VV      IIIIIIII  MM     MM]],
[[	⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⠇⠀⢠⠟⣿⠏⢀⣾⠟⢸⣿⡇																							 ]],
[[	⠀⠀⢠⣿⣿⣿⣿⠟⠘⠁⢠⠜⢉⣐⡥⠞⠋⢁⣴⣿⣿⠃																							 ]],
[[	⠀⠀⣾⢻⣿⣿⠃⠀⠀⡀⢀⡄⠁⠀⠀⢠⡾																									 ]],
[[	⠀⠀⠃⢸⣿⡇⠀⢠⣾⡇⢸⡇⠀⠀⠀⡞																									 ]],
[[	⠀⠀⠀⠈⢿⡇⡰⠋⠈⠙⠂⠙⠢																										 ]],
[[	⠀⠀⠀⠀⠈⢧ 																												 ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("e", "  New file" , ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "  Find File", ":FzfLua files<CR>"),
		dashboard.button(
			"c", 
			"  Configure Neovim", 
			function() 
				local config_path = vim.fn.stdpath("config")
				vim.cmd("cd " .. config_path)
				require("fzf-lua").files({ cwd = config_path }) 
			end
		),
      dashboard.button("q", "󰅚  Quit NVIM" , ":qa<CR>"),
	}
	local handle = io.popen("fortune")
	local fortune = handle:read("*a")
	handle:close()
	dashboard.section.footer.val = fortune
	dashboard.config.opts.noautocmd = true
	local startify = require("alpha.themes.startify")
	startify.file_icons_provider = "devicons"
	vim.cmd[[autocmd User AlphaReady echo 'ready']]
	alpha.setup(dashboard.config)
end

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = i,
}
