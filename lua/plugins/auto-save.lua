return {
  "Pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  config = function()
    require("auto-save").setup({
      enabled = true, -- 启用自动保存
      execution_message = {
        message = function()
          return ""
        end, -- 关闭 "AutoSave: saved" 提示
      },
      events = { "InsertLeave", "TextChanged" }, -- 触发自动保存的事件
      debounce_delay = 1000, -- 设置延迟（单位：毫秒）
    })
  end,
}
