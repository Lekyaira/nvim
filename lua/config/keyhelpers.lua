local module = {}

-- Key mapping functions
function module.n(k, v, o)
	o = o or { noremap = true, silent = true }
	v = v or ""
	if v == "" then
		vim.keymap.del("n", k)
	else
		vim.keymap.set("n", k, v, o)
	end
end
function module.i(k, v, o)
	o = o or { noremap = true, silent = true }
	v = v or ""
	if v == "" then
		vim.keymap.del("i", k)
	else
		vim.keymap.set("i", k, v, o)
	end
end
function module.v(k, v, o)
	o = o or { noremap = true, silent = true }
	v = v or ""
	if v == "" then
		vim.keymap.del("v", k)
	else
		vim.keymap.set("v", k, v, o)
	end
end
function module.o(k, v, o)
	o = o or { noremap = true, silent = true }
	v = v or ""
	if v == "" then
		vim.keymap.del("o", k)
	else
		vim.keymap.set("o", k, v, o)
	end
end

return module
