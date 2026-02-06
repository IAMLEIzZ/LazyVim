-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua 
-- Add any additional keymaps here
local keymap = vim.keymap

-- 设置 Esc
keymap.set("i", "jj", "<Esc>")

-- 设置 相对行号和绝对行号快捷键
keymap.set("n", "<leader>rn", function ()
  local relativenumber = vim.wo.relativenumber
  vim.wo.relativenumber = not relativenumber
  print("Relative number: " .. tostring(not relativenumber))
end, {desc = "Toggle relative number"})

-- ===== 调试快捷键（Go DAP） =====
keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "Continue/Start Debugging" })
keymap.set("n", "<leader>do", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
keymap.set("n", "<leader>di", "<cmd>DapStepInto<cr>", { desc = "Step Into" })
keymap.set("n", "<leader>dO", "<cmd>DapStepOut<cr>", { desc = "Step Out" })
keymap.set("n", "<leader>dt", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, { desc = "Conditional Breakpoint" })
keymap.set("n", "<leader>dr", "<cmd>DapToggleRepl<cr>", { desc = "Toggle REPL" })
keymap.set("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run Last" })
keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

