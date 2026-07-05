-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle LSP/linter diagnostics for the CURRENT buffer only.
-- (LazyVim's <leader>ud toggles diagnostics globally.)
vim.keymap.set("n", "<leader>ue", function()
  local buf = vim.api.nvim_get_current_buf()
  local on = vim.diagnostic.is_enabled({ bufnr = buf })
  vim.diagnostic.enable(not on, { bufnr = buf })
  vim.notify("Diagnostics " .. (on and "OFF" or "ON") .. " (this buffer)", vim.log.levels.INFO)
end, { desc = "Toggle Diagnostics (buffer)" })

-- Toggle autoformat
vim.keymap.set("n", "<leader>uf", function()
  vim.g.autoformat = not vim.g.autoformat
  vim.notify("Autoformat " .. (vim.g.autoformat and "ON" or "OFF"), vim.log.levels.INFO)
end, { desc = "Toggle Autoformat" })
