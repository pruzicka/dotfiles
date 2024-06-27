return {
  { "jesseduffield/lazygit" },
  { "lewis6991/gitsigns.nvim" },
  { "BurntSushi/ripgrep" },
  { "sbdchd/neoformat" },
  { "ryanoasis/vim-devicons" },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
