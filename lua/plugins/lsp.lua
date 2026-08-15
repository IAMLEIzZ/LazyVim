return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,      -- 变量赋值后显示类型（如 hostname 后面显示 string）
                compositeLiteralFields = true,  -- 结构体字面量字段名提示
                compositeLiteralTypes = true,   -- 结构体字面量类型提示
                constantValues = true,          -- 常量值提示
                functionTypeParameters = true,  -- 函数类型参数提示
                parameterNames = true,          -- 函数参数名提示（如 fmt.Printf 的参数名前显示 format, a...）
                rangeVariableTypes = true,      -- range 循环变量类型
              },
            },
          },
        },
      },
    },
  },
}
