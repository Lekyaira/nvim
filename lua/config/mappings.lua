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

-- Select all.
k.n("<leader>a", "ggVG", { desc = "Select All" })

-- Centers cursor when moving 1/2 page.
k.n("<C-d>", "<C-d>zz")
k.n("<C-u>", "<C-u>zz")

-- Centers cursor when moving to the bottom of the page.
k.n("G", "Gzz")
