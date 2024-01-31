return {
  { "jesseduffield/lazygit" },
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
