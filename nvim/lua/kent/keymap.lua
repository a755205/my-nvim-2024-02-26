local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
--[[ vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) ]]

keymap("n", "<leader>pv", ":vim.cmd.Ex<CR>", { noremap = true, silent = true })

-- Navigate buffers
keymap("n", "<D-]>", ":bnext<CR>", opts)
keymap("n", "<D-[>", ":bprevious<CR>", opts)

-- Visual Line Mode 下多行移動
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- 行合併時游標會方在行首，不會跟著移動
keymap("n", "J", "mzJ`z", opts)

-- 游標控制（移動時置中）
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- 游標控制（搜尋時置中）
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- 選取時貼上不會蓋上新的register, 第一次貼上要用leader p
keymap("x", "<leader>p", '"_dP', opts)
--
-- 更改游標下的單字in buffer
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

keymap("n", "<leader>q", ":qa<CR>", opts)

--[[ vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") ]]
--[[ vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) ]]

--移除方向鍵
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-- 存擋
keymap("n", "<C-s>", ":w<CR>", opts)

-- window管理
keymap("n", "<leader>wv", ":vsplit<CR>", opts)
keymap("n", "<leader>ws", ":split<CR>", opts)

-- custom keymap use function
require("kent/myKeymaps")
