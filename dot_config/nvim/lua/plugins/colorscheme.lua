return {
  -- One Dark (warmer) — active colorscheme. Matches the kitty onedark-warmer theme.
  -- Transparency lets kitty's background show through.
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "warmer",      -- darkest warm variant
      transparent = true,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "italic",
      },
    },
  },

  -- Set onedark as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
