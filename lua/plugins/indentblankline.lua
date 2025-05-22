return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    indent = {
      char = "│", -- Customize your indent character here
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    exclude = {
      buftypes = { "terminal", "nofile" },
      filetypes = { "help", "dashboard", "lazy", "NvimTree" },
    },
  },
}

