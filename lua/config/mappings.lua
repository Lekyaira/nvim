k = require("config.keyhelpers")

-- Set Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set Command
k.n(";", ":")
k.v(";", ":")

-- Remap for Colemak.layout
k.n("n", "j")
k.n("e", "k")
k.n("i", "l")
k.n("t", "a")
k.n("T", "A")
k.n("a", "i")
k.n("A", "I")
k.n("f", "e")
k.v("n", "j")
k.v("e", "k")
k.v("i", "l")
k.v("f", "e")
k.o("n", "j")
k.o("e", "k")
k.o("i", "l")

-- Page up/down
k.n("j", "<C-u>")
k.n("k", "<C-d>")
k.v("j", "<C-u>")
k.v("k", "<C-d>")

-- Barbar
k.n("<C-s>", "<Cmd>BufferPrevious<CR>")
k.n("<C-t>", "<Cmd>BufferNext<CR>")
k.n("<C-S-s>", "<Cmd>BufferMovePrevious<CR>")
k.n("<C-S-t>", "<Cmd>BufferMoveNext<CR>")
k.n("<Leader>p", "<Cmd>BufferPin<CR>", { desc = "Pin/Unpin Current Buffer" })
k.n("<Leader>x", "<Cmd>SmartBdelete<CR>", { desc = "Close Current Buffer" })

-- Leap
k.n("s", "<Plug>(leap)")

-- Fzf
k.n("<Leader>f", [[:FzfLua files<CR>]], { desc = "Fuzzy Find Files" })

-- Nvim-Tree
k.n("<Leader>e", [[:NvimTreeToggle<CR>]], { desc = "File Explorer" })

-- Select all.
k.n("<leader>a", "ggVG")

-- Centers cursor when moving 1/2 page down.
k.n("<C-d>", "<C-d>zz")

-- Centers cursor when moving to the bottom of the page.
k.n("G", "Gzz")

-- Todo-comments
k.n("]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
k.n("[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
k.n("<leader>td", [[:TodoQuickFix]], { desc = "Lists all Todos" })
