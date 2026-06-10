local function system_is_dark()
  if (vim.uv or vim.loop).os_uname().sysname ~= "Darwin" then
    return vim.o.background == "dark"
  end

  vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
  return vim.v.shell_error == 0
end

local function catppuccin_flavour()
  return system_is_dark() and "mocha" or "latte"
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- 非常重要：保证最先加载
    lazy = false,
    config = function()
      local function apply_theme()
        local flavour = catppuccin_flavour()
        vim.o.background = flavour == "latte" and "light" or "dark"

        require("catppuccin").setup({
          flavour = flavour,
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

        vim.cmd.colorscheme("catppuccin-nvim")
        vim.cmd("highlight Normal ctermbg=none guibg=none")
      end

      apply_theme()

      local group = vim.api.nvim_create_augroup("catppuccin_follow_system", { clear = true })
      vim.api.nvim_create_autocmd({ "FocusGained", "VimResume", "TermLeave" }, {
        group = group,
        callback = apply_theme,
      })
    end,
  },
}

