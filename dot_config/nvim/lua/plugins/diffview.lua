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
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: working-tree changes" },
    { "<leader>gv", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: current file history" },
    { "<leader>gV", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: branch history" },
  },
  opts = {
    enhanced_diff_hl = true, -- richer diff highlighting (word-level)
    view = {
      merge_tool = { layout = "diff3_mixed" },
    },
  },
}
