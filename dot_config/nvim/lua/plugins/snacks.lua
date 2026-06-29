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
        -- ignored = false (default) still honors .gitignore
        grep = { hidden = true, exclude = exclude },
        files = { hidden = true, exclude = exclude },
      },
    },
  },
}
