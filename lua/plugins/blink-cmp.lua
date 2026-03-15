return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- 用默认预设
        preset = "default",

        -- 改成 Ctrl-j / Ctrl-k 上下选择
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },

        -- 回车：只有“当前已经选中了某一项”才确认补全；
        -- 如果没有选中任何项，就走 fallback，也就是正常换行
        ["<CR>"] = { "accept", "fallback" },
      },

      completion = {
        list = {
          selection = {
            -- 补全菜单出来时，不要默认选中第一项
            preselect = false,

            -- 移动选择时，不要自动把候选内容先插进去
            auto_insert = false,
          },
        },
      },
    },
  },
}
