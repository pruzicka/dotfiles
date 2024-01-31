return {
  {
    "nvim-treesitter/nvim-treesitter",

    require("nvim-treesitter.configs").setup({
      -- ensure_installed = { "javascript", "ruby" }, -- This will install the Ruby parser if it's not already installed
      sync_install = false,
      auto_install = true,
      ignore_install = { "all" },
      highlight = {
        enable = true, -- Enable syntax highlighting
      },
    }),
  },
}
