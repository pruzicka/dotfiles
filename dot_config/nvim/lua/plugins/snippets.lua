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
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snippets" } }),
  },
}
