return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip").filetype_extend("eruby", { "html" })
    end,
  },
  {
    require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snippets" } }),
  },
}
