return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = { "javascript", "ruby", "html", "vim", "dockerfile", "css", "markdown", "gitignore" }, -- This will install the Ruby parser if it's not already installed
      -- auto_install = true,
      sync_install = false,
      ignore_install = { "all" },
      highlight = {
        enable = true, -- Enable syntax highlighting
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
