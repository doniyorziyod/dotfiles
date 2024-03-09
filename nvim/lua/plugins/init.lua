local keys = {
    { "<C-a>", function() require("harpoon"):list():append() end },
    { "<C-h>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
}

for i = 1, 5, 1 do
    table.insert(keys, { "<C-" .. i .. ">", function() require("harpoon"):list():select(i) end })
end

local Plugins = {
    -- Themes
    {
        'mcchrish/zenbones.nvim',
        dependencies = { 'rktjmp/lush.nvim' },
    },
    {'andreasvc/vim-256noir'},
    {'kvrohit/rasmus.nvim'},
    { 't184256/vim-boring' },
    { 'Jorengarenar/vim-darkness' },
    { 'ewilazarus/preto' },
    {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
    },
    { "ellisonleao/gruvbox.nvim" },
    -- harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "nvim-lua/plenary.nvim",
        keys = keys,
        config = function() require("harpoon"):setup() end,
    }
}

return Plugins
