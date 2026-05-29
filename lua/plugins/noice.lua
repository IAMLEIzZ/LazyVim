return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        -- 关闭右下角 LSP 进度通知（pyright 打字时疯狂刷屏的主要来源）
        progress = {
          enabled = false,
        },
        -- 可选：把 hover/signature 也接管回来，避免消息乱飘
        hover = { enabled = true },
        signature = { enabled = true },
      },
    },
  },
}
