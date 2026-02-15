-- 终端支持浏览图片
return {
  {
    "3rd/image.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty",
      })
    end,
  },
}
