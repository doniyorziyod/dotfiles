local Plugins = {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {'aveplen/ruscmd.nvim'},

    -- Themes
    {
        'mcchrish/zenbones.nvim',
        dependencies = { 'rktjmp/lush.nvim' },
    },
    {'andreasvc/vim-256noir'},
    {'kvrohit/rasmus.nvim'},
}

return Plugins
