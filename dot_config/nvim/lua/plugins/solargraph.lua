-- local lspconfig = require("lspconfig")
--
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       -- Useful for debugging formatter issues
--       format_notify = true,
--       servers = {
--         bashls = {
--           filetypes = { "sh", "zsh" },
--         },
--         diagnosticls = {},
--         dockerls = {},
--         jsonls = {},
--         lua_ls = {
--           Lua = {
--             workspace = { checkThirdParty = false },
--             telemetry = { enable = false },
--           },
--         },
--         marksman = {},
--         ruby_lsp = {
--           cmd = { "bundle", "exec", "ruby-lsp" },
--           init_options = {
--             formatter = "auto",
--           },
--         },
--         rubocop = {
--           -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
--           cmd = { "bundle", "exec", "rubocop", "--lsp" },
--           root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
--         },
--         solargraph = {
--           cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
--           root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
--           settings = {
--             solargraph = {
--               autoformat = true,
--               completion = true,
--               diagnostic = true,
--               folding = true,
--               references = true,
--               rename = true,
--               symbols = true,
--             },
--           },
--         },
--         yamlls = {},
--         vimls = {},
--       },
--     },
--   },
-- }

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        solargraph = {},
      },
    },
  },
}
