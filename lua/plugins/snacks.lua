-- lua/plugins/snacks.lua
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {
        enabled = true,

        -- 图片/视频/文档格式支持（官方默认里这些都在 formats 里）
        formats = {
          "png", "jpg", "jpeg", "gif", "bmp", "webp", "tiff", "heic", "avif",
          "mp4", "mov", "avi", "mkv", "webm",
          "pdf", "icns",
        },

        -- 让 Snacks 在某些环境里强制识别/不识别（比如 ghostty）
        -- 例如：export SNACKS_GHOSTTY=true
        env = {},

        -- 图片缓存目录
        cache = vim.fn.stdpath("cache") .. "/snacks/image",

        -- 图片 buffer/window 的显示选项（filetype=image 的窗口会应用）
        wo = {
          wrap = false,
          number = false,
          relativenumber = false,
          cursorcolumn = false,
          signcolumn = "no",
          foldcolumn = "0",
          list = false,
          spell = false,
          statuscolumn = "",
        },

        -- 文档内联渲染（markdown/html/...）
        doc = {
          enabled = true,

          -- inline: 在 buffer 里用占位符“就地显示”
          -- float: 如果 inline 不可用，则用浮窗显示
          inline = true,
          float = true,

          -- 浮窗最大尺寸（列/行）
          max_width = 80,
          max_height = 40,

          -- conceal：渲染后把原始图片文本“隐藏”（例如 markdown 的 ![]()）
          -- 这里给一个官方示例：只 conceal 数学公式图片（type == "math"）
          conceal = function(lang, type)
            return type == "math"
          end,

          -- 文档里常见的图片目录，用于相对路径补全
          img_dirs = {
            "img", "images", "assets", "static", "public",
            "media", "attachments",
          },
        },

        -- 图片引用路径解析（目前官方说主要用于 markdown）
        -- 默认 nil 表示：相对路径按“当前文件所在目录”解析
        -- resolve = function(file, src)
        --   return nil
        -- end,

        -- 图标：标记“这行下面有图片”
        icons = {
          math = "󰪚 ",
          chart = "󰄧 ",
          image = " ",
        },

        -- 转换器配置：非 PNG 通常需要 ImageMagick（magick）
        convert = {
          notify = false, -- 转换错误是否弹通知

          -- Mermaid 转换参数（如果你用到 chart/mermaid）
          mermaid = function()
            local theme = vim.o.background == "light" and "neutral" or "dark"
            return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
          end,

          -- ImageMagick 参数模板
          magick = {
            default = { "{src}[0]", "-scale", "1920x1080>" },
            vector  = { "-density", 192, "{src}[{page}]" },
            math    = { "-density", 192, "{src}[{page}]", "-trim" },
            pdf     = { "-density", 192, "{src}[{page}]", "-background", "white", "-alpha", "remove", "-trim" },
          },
        },

        -- 调试开关（排错用）
        debug = {
          request = false,
          convert = false,
          placement = false,
        },
      },
    },

    -- 建议加个快捷键：在光标处浮窗预览（对 markdown 图片链接也很方便）
    keys = {
      { "<leader>ih", function() Snacks.image.hover() end, desc = "Snacks.image: Hover preview" },
    },
  },
}
