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

map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

map("n", "sh", ":split<CR><C-w>w", opts)
map("n", "sv", ":vsplit<CR><C-w>w", opts)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-q>", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { silent = true })
vim.keymap.set("n", "<leader>on", ":ObsidianNew ")
vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>", { silent = true })
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { silent = true })
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { silent = true })
vim.keymap.set("n", "<C-t>", ":ObsidianToday<CR>", { silent = true })
vim.keymap.set("n", "<C-n>", ":ObsidianToday 1<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", ":ObsidianToday -1<CR>", { silent = true })
vim.keymap.set("n", "<leader>os", ":ObsidianSearch ")
vim.keymap.set("n", "<leader>oi", ":ObsidianPasteImg<CR>", { silent = true })
vim.keymap.set("n", "<leader>oc", ":ObsidianTOC<CR>", { silent = true })
vim.keymap.set("n", "<leader>og", ":ObsidianTags<CR>", { silent = true })
