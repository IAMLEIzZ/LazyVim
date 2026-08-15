return{
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
    config = function()
        vim.g.rustaceanvim = {
            tools = {
                -- 自动启用 inlay hints
            },
            server = {
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr, silent = true }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                    -- Rust 专属快捷键
                    vim.keymap.set('n', '<leader>rr', '<cmd>RustLsp runnables<CR>', opts)
                    vim.keymap.set('n', '<leader>rt', '<cmd>RustLsp testables<CR>', opts)
                    vim.keymap.set('n', '<leader>rd', '<cmd>RustLsp debuggables<CR>', opts)
                    vim.keymap.set('n', '<leader>re', '<cmd>RustLsp explainError<CR>', opts)
                    vim.keymap.set('n', '<leader>rc', '<cmd>RustLsp openCargo<CR>', opts)
                    vim.keymap.set('n', '<leader>rp', '<cmd>RustLsp parentModule<CR>', opts)
                    vim.keymap.set('n', '<leader>rm', '<cmd>RustLsp expandMacro<CR>', opts)

                    -- Inlay hints 开关（Neovim 0.10+）
                    if vim.lsp.inlay_hint then
                        vim.keymap.set('n', '<leader>ih', function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                                { bufnr = bufnr }
                            )
                        end, opts)
                    end
                end,
                default_settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            allFeatures = true,
                        },
                        checkOnSave = {
                            command = 'clippy', -- 保存时跑 clippy 而不是 check
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
            dap = {
                -- codelldb 会自动配置调试
            },
        }
    end,
  }
}
