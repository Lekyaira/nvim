-- Leap tweaks
local function i()
	-- Skip the middle of alphabetic words
	require("leap").opts.preview_filter = function(ch0, ch1, ch2)
		return not (
			ch1:match("%s") or
			ch0:match("%a") and ch1:match("%a") and ch2:match("%a")
		)
	end

	-- Define equivalence classes for brackets and quotes in addition to default whitespace
	require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", '\'"`' }
end

return {
	"ggandor/leap.nvim",
	init = i,
	keys = {
		{ "s", "<Plug>(leap)", desc = "Leap to..." },
	},
}
