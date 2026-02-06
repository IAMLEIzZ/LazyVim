-- lua/plugins/markdown.lua
return {
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    config = function()
      -- 禁用折叠
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    -- build = "cd app && npm install",
    build = "cd app && npm install && git restore .",
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    ft = "markdown",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
}
