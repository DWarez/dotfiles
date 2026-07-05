-- Snacks picker: search inside dot-folders, but skip noise dirs.
-- `.git`/`.bare` are already excluded by the grep source itself.
local exclude = {
  "node_modules",
  "__pycache__",
  ".venv",
  ".mypy_cache",
  ".pytest_cache",
  ".ruff_cache",
  ".next",
  "dist",
  "target",
}

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        -- ignored = true searches .gitignore'd paths too; exclude list keeps the noise out
        grep = { hidden = true, ignored = true, exclude = exclude },
        files = { hidden = true, ignored = true, exclude = exclude },
      },
    },
  },
}
