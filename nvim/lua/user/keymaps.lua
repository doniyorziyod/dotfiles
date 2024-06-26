local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>silent Oil<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

map("n", "sh", ":split<CR><C-w>w", opts)
map("n", "sv", ":vsplit<CR><C-w>w", opts)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<C-S-t>", "<cmd>ObsidianToday<cr>", { silent = true })
vim.keymap.set("n", "<C-S-p>", "<cmd>ObsidianToday -1<cr>", { silent = true })
vim.keymap.set("n", "<C-S-f>", "<cmd>ObsidianToday 1<cr>", { silent = true })
vim.keymap.set("n", "<leader>on", ":ObsidianNew ")
vim.keymap.set("n", "<leader>ou", "<cmd>ObsidianNew<cr>", { silent = true })
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { silent = true })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { silent = true })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", { silent = true })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { silent = true })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinkNew<cr>", { silent = true })
vim.keymap.set("n", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { silent = true })
