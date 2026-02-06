return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          --'.git', '.DS_Store',  -- 'thumbs.db',
        },
        never_show = {'.git'},
      },
      follow_current_file = {
        enabled = false,    -- 关闭跟随，保持固定根目录
      },
    }
  }
}

