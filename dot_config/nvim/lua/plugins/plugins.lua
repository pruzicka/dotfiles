return {
  { "jesseduffield/lazygit" },
  { "BurntSushi/ripgrep" },
  { "nvim-treesitter/nvim-treesitter" },
  { "sbdchd/neoformat" },
  { "ryanoasis/vim-devicons" },
  { "lewis6991/gitsigns.nvim" },
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
  {
    "echasnovski/mini.surround",
    opts = {
      custom_surroundings = {
        ["="] = { output = { left = "<%= ", right = " %>" } },
        ["-"] = { output = { left = "<% ", right = " %>" } },
      },
    },
  },
}
