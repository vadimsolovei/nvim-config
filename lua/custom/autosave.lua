-- Autocommand to save buffer when Neovim loses focus (or is suspended)

-- Function to save the current buffer if it's modified
local function auto_save_on_leave()
  -- Check if the current buffer is a normal file buffer (not a help, quickfix, terminal, etc.)
  -- and if it has been modified.
  if vim.bo.buftype == '' and vim.bo.modified then
    vim.cmd 'silent! w' -- Save the current buffer silently
    -- You can add a notification here if you want to see when it saves:
    -- vim.notify('Buffer saved on focus lost!', vim.log.levels.INFO)
  end
end

-- Create an autocommand group to manage our autocommands
local auto_save_augroup = vim.api.nvim_create_augroup('AutoSaveOnLeave', { clear = true })

-- Trigger `auto_save_on_leave` before Neovim is suspended (e.g., Ctrl+Z)
-- and before Neovim exits.
-- When you switch to another application, the terminal where Neovim is running
-- effectively "loses focus" and might trigger actions similar to suspension or leaving.
vim.api.nvim_create_autocmd({ 'VimLeavePre', 'VimSuspend' }, {
  group = auto_save_augroup,
  callback = auto_save_on_leave,
  desc = 'Automatically save buffer when Neovim loses focus/suspends',
})

-- Note: `FocusGained` and `FocusLost` events *do* exist in Neovim,
-- but they primarily refer to the focus of Neovim *within* a GUI client
-- (like Neovim-qt, Alacritty's Neovim integration, etc.), not necessarily
-- the terminal window losing focus on a desktop environment level.
-- 'VimSuspend' and 'VimLeavePre' are generally more reliable for this
-- "save on blur" behavior in a terminal environment.
