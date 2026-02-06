return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "catppuccin",
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "neo-tree", "dashboard", "alpha" },
          },
        },

        sections = {
          lualine_a = {
            { "mode" },
          },

          lualine_b = {
            { "branch", icon = "" },
            { "diff" },
            { "diagnostics" },
          },

          lualine_c = {
            {
              "filename",
              path = 3,              -- 相对路径
              shorting_target = 9999, -- 关键：永不省略 !!!
              symbols = {
                modified = "●",
                readonly = "",
                unnamed = "[No Name]",
              },
            },
          },

          lualine_x = {
            { "encoding" },
            { "fileformat" },
            { "filetype" },
          },

          lualine_y = {
            { "progress" },
          },

          lualine_z = {
            { "location" },
          },
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              path = 1,
              shorting_target = 9999,
            },
          },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },

        extensions = {
          "neo-tree",
          "lazy",
          "toggleterm",
          "mason",
        },
      }
    end,
  },
}

