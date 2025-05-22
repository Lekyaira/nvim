return {
  "petertriho/nvim-scrollbar",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("scrollbar").setup({
      -- Customize to your liking
      show = true,
      handle = {
        text = " ",
        blend = 30,
        color = nil,
        color_nr = nil, -- terminal color
        highlight = "ScrollbarHandle",
        hide_if_all_visible = true,
      },
      marks = {
        Search = {
          text = { "-", "=" },
          priority = 1,
          highlight = "ScrollbarSearch",
        },
        Error = {
          text = { "⎯", "⎯" },
          priority = 2,
          highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
          text = { "⎯", "⎯" },
          priority = 2,
          highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
          text = { "⎯", "⎯" },
          priority = 2,
          highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
          text = { "⎯", "⎯" },
          priority = 2,
          highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
          text = { "⎯", "⎯" },
          priority = 2,
          highlight = "ScrollbarMisc",
        },
      },
      excluded_buftypes = { "terminal" },
      excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "NvimTree" },
      handlers = {
        diagnostic = true,
        gitsigns = true,
        search = true,
        cursor = false,
        handle = true,
        ale = false,
      },
    })
  end,
}

