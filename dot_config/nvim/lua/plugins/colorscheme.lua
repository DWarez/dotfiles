return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("onedark").setup({
      style = "darker",
    })
    -- Enable theme
    require("onedark").load()
    -- Set cursor color after theme loads
    vim.opt.termguicolors = true
    vim.opt.guicursor =
      "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

    -- Override cursor highlight
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#ffffff" })
    vim.api.nvim_set_hl(0, "lCursor", { fg = "#000000", bg = "#ffffff" })
  end,
}
