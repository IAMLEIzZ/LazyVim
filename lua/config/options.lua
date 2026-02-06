-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.encoding = "UTF-8"

vim.o.fileencoding = "utf-8"

-- 缩进4个空格等于一个Tab
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4

local opt = vim.opt
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
-- opt.listchars = "space:·"

-- 默认关闭保存文件时自动格式化
vim.g.autoformat = false

vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

-- 关闭 autochdir
vim.opt.autochdir = false
