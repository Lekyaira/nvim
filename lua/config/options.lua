local options = {
   history = 100,
   clipboard = "unnamedplus", -- Use system clipboard
   swapfile = false,
   backup = false,
   undofile = true, -- Undos are saved to a file
   cursorline = true, -- Highlight current line
   ttyfast = true, -- Faster scrolling
   smoothscroll = true,
   title = true, -- Automatic window titlebar
   number = true, -- Show line numbers
   relativenumber = true,
   numberwidth = 4,
   shiftwidth = 3,
   smarttab = true, -- Use 'shiftwidth' when inserting Tab
   cindent = true, -- Use C programming indenting
   autoindent = false, -- Don't use previous line's indenting
   tabstop = 3, -- Number of spaces used for tabs
   ignorecase = true, -- Ignore case when searching
   smartcase = true, -- Use case in search when explicitly searched
   conceallevel = 2, -- Markdown conceal
   concealcursor = "nc",
	wrap = false,
}

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.diagnostic.config({
   signs = false,
})
