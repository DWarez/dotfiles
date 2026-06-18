-- VSCode-like diff/history UI: side-by-side diffs of all changes, a file panel
-- to stage/revert from, and file/branch history.
return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewFileHistory",
  },
  keys = {
    {
      "<leader>gd",
      function()
        -- toggle: close if a Diffview is open, otherwise open it
        if next(require("diffview.lib").views) ~= nil then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Diffview (toggle working-tree changes)",
    },
    { "<leader>gv", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: current file history" },
    { "<leader>gV", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: branch history" },
  },
  opts = {
    enhanced_diff_hl = true, -- richer diff highlighting (word-level)
    view = {
      merge_tool = { layout = "diff3_mixed" },
    },
    -- press q to close from anywhere inside Diffview
    keymaps = {
      view = { { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } } },
      file_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } } },
      file_history_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } } },
    },
  },
}
