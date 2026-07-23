return {
  -- Rose Pine — active colorscheme.
  -- Chosen for CVD safety: no green-yellow hue competition in syntax.
  -- pine (#31748f) is teal-blue, gold (#f6c177) is warm amber — maximally
  -- separated in both hue and luminance. Transparency lets kitty's
  -- background_blur show through.
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "main",
      dark_variant = "main",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    },
  },

  -- Set rose-pine as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
