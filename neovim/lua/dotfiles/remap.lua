-- Netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Buffer & file management
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>bd<cr>")

-- Escape
vim.keymap.set("i", "lkj", "<esc><cmd>w<cr>")
vim.keymap.set("i", "kj", "<esc>")

-- Clipboard management
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set({ "n", "v" }, "y", "\"*y")
vim.keymap.set({ "n", "v" }, "<C-c>", "\"*y")

-- Navigation
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "J", "<C-d>zz")
vim.keymap.set("n", "K", "<C-u>zz")
vim.keymap.set("n", "B", "zb")
vim.keymap.set("n", "T", "zt")
vim.keymap.set("n", "m", "%")

-- Search & replace
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Moving text
vim.keymap.set("v", "J", "<cmd>m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<cr>gv=gv")

-- Buffers
vim.keymap.set("n", "gn", "<cmd>bnext<cr>")
vim.keymap.set("n", "gp", "<cmd>bprev<cr>")

-- Quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "<esc>", "<cmd>ccl<cr>")
