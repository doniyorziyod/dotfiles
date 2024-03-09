local M = {}

M.sources = {
  { name = 'nvim_lsp', priority = 1000 },
  { name = 'luasnip', keyword_length = 2 },
  { name = 'path' },
}

M.formatting = {
  fields = { 'abbr', 'kind', 'menu' },
  format = function(entry, item)
        local menu_icon = {
          nvim_lsp = 'lsp',
          luasnip = 'snip',
          path = 'path',
        }

        item.menu = menu_icon[entry.source.name]
        return item
    end,
}

M.setup = function(options)
  local border = options.border or 'single'
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = '',
    })
  end

  sign({ name = 'DiagnosticSignError', text = 'E' })
  sign({ name = 'DiagnosticSignWarn', text = 'W' })
  sign({ name = 'DiagnosticSignHint', text = 'H' })
  sign({ name = 'DiagnosticSignInfo', text = 'I' })

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    float = true,
  })

  local cmp = require('cmp')
  local luasnip = require('luasnip')

  -- load custom snippets
  require('luasnip.loaders.from_vscode').lazy_load()

  local select_opts = { behavior = cmp.SelectBehavior.Select }

  cmp.setup({
    sources = M.sources,

    window = {
      completion = { border = border },
      documentation = { border = border },
    },

    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    formatting = M.formatting,

mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<C-Space>'] = cmp.mapping.complete(),

      ['<C-f>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, {'i', 's'}),

      ['<C-b>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {'i', 's'}),
    },  
})
end

return M
