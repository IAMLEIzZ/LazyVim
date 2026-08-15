return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = ":call mkdp#util#install()",  -- 注意前面加冒号，作为 Vim 命令执行
    keys = {
      { "<leader>mr", "<cmd>MarkdownPreview<cr>",       desc = "Markdown Preview",      ft = "markdown" },
      { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>",   desc = "Stop Markdown Preview",   ft = "markdown" },
      { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview", ft = "markdown" },
    },
  }
}
