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
      transparent = true, -- let kitty's translucent/blurred background show through
      overrides = function(colors)
        -- Clear gutter/chrome backgrounds so the blur shows through the whole
        -- editor chrome, matching One Dark Pro's transparency scope (Normal,
        -- SignColumn, FoldColumn, LineNr, EndOfBuffer all see-through).
        return {
          SignColumn = { bg = "NONE" },
          FoldColumn = { bg = "NONE" },
          LineNr = { bg = "NONE" },
          EndOfBuffer = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          MsgArea = { bg = "NONE" },
        }
      end,
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

  -- Active colorscheme: zero.nvim with a graphite palette override.
  -- zero.nvim is normally a green-signature theme; we repalette it via
  -- on_palette to the exact steel tones used by tmux/kitty/starship so the
  -- whole terminal layer is coherent graphite. Syntax accents stay
  -- distinguishable via a steel gradient (keyword/string/function/type map
  -- to different steel tones) + muted brick for errors and faint mauve for
  -- types. Switch to a stock theme anytime: :colorscheme onedark / kanagawa-dragon
  {
    "czrd/zero.nvim",
    lazy = false,
    priority = 1001, -- above onedarkpro (1000) and kanagawa (999)
    opts = {
      style = "dark",
      transparent = true, -- let kitty's translucent/blurred background show through
      terminal_colors = true,
      on_palette = function(p)
        -- Graphite palette — matches tmux/graphite.conf + kitty + starship.
        -- Steel gradient for syntax differentiation; muted brick for errors.
        p.bg             = "#16181c" -- surface (transparent via transparent=true)
        p.bg_dark        = "#111316"
        p.bg_float       = "#23262c" -- surface_high (popups, floats)
        p.bg_cursorline  = "#1f2127"
        p.bg_visual      = "#2a2f36"
        p.bg_selection   = "#2a2f36"
        p.bg_statusline  = "#23262c"
        p.border         = "#3a4148" -- outline
        p.fg             = "#c2c8cf" -- on_surface
        p.fg_dim         = "#8b939e" -- primary steel
        p.fg_gutter      = "#6e7682" -- slate
        p.comment        = "#6e7682"
        -- Syntax accents (steel gradient + two muted hues for differentiation)
        p.green   = "#8b939e" -- keywords   -> mid steel
        p.gold    = "#d4dae0" -- strings    -> pale steel (sheen)
        p.yellow  = "#d4dae0"
        p.blue    = "#c2c8cf" -- functions  -> bright steel
        p.violet  = "#9a8b9e" -- types      -> faint mauve
        p.orange  = "#b8a878" -- constants  -> muted bronze
        p.teal    = "#6e7682" -- operators  -> slate
        p.red     = "#c4746e" -- errors     -> muted brick
        p.error   = "#c4746e"
        p.warn    = "#c4746e"
        p.info    = "#8b939e"
        p.hint    = "#6e7682"
        p.ok      = "#8b939e"
        p.git_add    = "#8b939e"
        p.git_change = "#d4dae0"
        p.git_delete = "#c4746e"
      end,
      -- Search highlighting: zero.nvim defaults Search to fg=fg(bg=yellow), which
      -- is light-on-light under this graphite palette and unreadable. Override so
      -- all matches are dark text on the pale-steel sheen; the current match
      -- (IncSearch/CurSearch) inverts to bright text on dark for emphasis.
      on_highlights = function(hl, p)
        hl.Search = { fg = p.bg_dark, bg = p.yellow }
        hl.IncSearch = { fg = p.yellow, bg = p.bg_dark, bold = true }
        hl.CurSearch = { fg = p.yellow, bg = p.bg_dark, bold = true }
      end,
    },
  },

  -- Set zero as the active colorscheme (loaded by priority; LazyVim just
  -- ensures the name is resolved at install time).
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zero",
    },
  },
}
