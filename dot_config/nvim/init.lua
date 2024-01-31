-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "ruby" }, -- This will install the Ruby parser if it's not already installed
  highlight = {
    enable = true, -- Enable syntax highlighting
  },
})

vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme PaperColor")
vim.cmd("colorscheme kanagawa")
