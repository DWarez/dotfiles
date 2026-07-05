return {
  {
    "neovim/nvim-lspconfig",
    -- opts fn runs after LazyVim's python extra, so these enabled flags win.
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.ty = { mason = false } -- ty is on PATH via `uv tool install ty`
      for _, s in ipairs({ "pyright", "basedpyright", "ruff", "ruff_lsp" }) do
        opts.servers[s] = vim.tbl_extend("force", opts.servers[s] or {}, { enabled = false })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "python", "ninja", "rst", "c", "cpp" })
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup("python")
      end,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
      name = { "venv", ".venv", "env", ".env" },
    },
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false },
          runner = "pytest",
        },
      },
    },
  },
}
