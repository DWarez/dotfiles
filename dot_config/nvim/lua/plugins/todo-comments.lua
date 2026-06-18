-- Highlight TODO/FIXME/etc. keywords in comments.
-- - only the keyword is highlighted (not the rest of the comment line)
-- - case-insensitive-ish: lower/mixed-case variants are added as `alt`s, since
--   todo-comments hardcodes case-sensitive matching (\C) in its matcher.
return {
  "folke/todo-comments.nvim",
  opts = {
    highlight = {
      keyword = "bg", -- colour just the keyword (background behind the word)
      after = "", -- do NOT colour the comment text after the keyword
    },
    keywords = {
      TODO = { icon = " ", color = "info", alt = { "todo", "Todo", "ToDo" } },
      FIX = {
        icon = " ",
        color = "error",
        alt = { "FIXME", "fixme", "Fixme", "BUG", "bug", "FIXIT", "ISSUE" },
      },
      HACK = { icon = " ", color = "warning", alt = { "hack", "Hack" } },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "warn", "Warn", "warning", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO", "note", "Note" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "test" } },
    },
  },
}
