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

-- Show trailing whitespace on the current line
a("CursorMoved", {
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local ns = vim.api.nvim_create_namespace("show_trailing_ws")
		vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

		local row = vim.api.nvim_win_get_cursor(0)[1] - 1
		local line = vim.api.nvim_get_current_line()
		if s then
			local col_start = #s
			local col_end = #line
			vim.api.nvim_buf_add_highlight(bufnr, ns, "Whitespace", row, col_start, col_end)
		end
	end
})
