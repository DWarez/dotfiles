return {
  -- One Dark Pro — alternative colorscheme (cold blue/cyan). Not active;
  -- switch with :colorscheme onedark. Kept installed as a fallback.
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparency = true, -- let kitty's translucent/blurred background show through
      },
    },
  },

  -- Kanagawa stays installed and configured but is NOT applied automatically.
  -- Switch any time with:  :colorscheme kanagawa-dragon
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 999,
    opts = {
      compile = true,
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      terminalColors = true,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
    end,
  },

  -- Active colorscheme: Kanagawa-dragon — muted steel/grey palette that
  -- reads as graphite and sits coherently beside the graphite terminal layer
  -- (tmux/kitty/starship). One Dark Pro stays installed as an alternative:
  --   :colorscheme onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}
