return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- 非常重要：保证最先加载
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = false,
          mini = {
            enabled = true,
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

