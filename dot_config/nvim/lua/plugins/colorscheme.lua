return {
  -- Tokyo Night — active colorscheme.
  -- Chosen for CVD safety: the main syntax categories use distinct,
  -- well-separated hues — strings=green, functions=blue, types=cyan,
  -- keywords=purple, constants=orange. No green-yellow competition.
  -- The two places Tokyo Night uses yellow (function parameters and
  -- documentation strings) are remapped below to orange/cyan so the
  -- palette is fully CVD-safe. Transparency lets kitty's background_blur
  -- show through.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",         -- darkest variant
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- CVD safety: remap the two yellow syntax uses so no green-yellow
        -- discrimination is ever required.
        --   @variable.parameter  yellow -> orange (constants color)
        --   @string.documentation yellow -> cyan (keyword color)
        hl["@variable.parameter"] = { fg = c.orange }
        hl["@variable.parameter.builtin"] = { fg = c.orange }
        hl["@string.documentation"] = { fg = c.cyan }
      end,
    },
  },

  -- Set tokyonight as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
