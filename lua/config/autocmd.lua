local function a(c, f)
	vim.api.nvim_create_autocmd(c, f)
end

-- Close nvimtree if it's the last buffer open
a("BufEnter", {
	pattern = "*",
	callback = function()
		if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
			vim.cmd("quit")
		end
	end,
})
