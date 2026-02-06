-- ~/.config/nvim/lua/plugins/tokyonight.lua
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm", -- 可选：storm, night, moon, day
    transparent = true, -- 开启透明背景
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "transparent",
      floats = "transparent",
    },
    sidebars = { "qf", "help", "terminal", "packer" },
    dim_inactive = true,
    lualine_bold = true,
  },
    config = function(_, opts)
    require("tokyonight").setup(opts)
    -- vim.cmd([[colorscheme tokyonight]])

    -- 自定义浮窗和普通背景透明
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  end,
}
