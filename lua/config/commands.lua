-- Delete the buffer, then close the window if it's the last one
local function smart_bdelete()
  -- Count how many *listed* buffers remain
  local buffers = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1
  end, vim.api.nvim_list_bufs())

  -- Delete the current buffer
  vim.cmd("bdelete")

  -- If no other listed buffers remain, quit Neovim
  if #buffers <= 1 then
    vim.cmd("q")
  end
end

-- Create a command or keymap for convenience
vim.api.nvim_create_user_command("SmartBdelete", smart_bdelete, {})
