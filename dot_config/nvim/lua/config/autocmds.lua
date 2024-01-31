-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup("RubyFormatting", { clear = true })

autocmd("BufWritePre", {
  group = group,
  pattern = { "*.rb" },
  command = "Neoformat prettier",
})
