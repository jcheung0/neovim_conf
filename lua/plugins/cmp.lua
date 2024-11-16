return {

      {
        'hrsh7th/nvim-cmp',
        dependencies = {
          'hrsh7th/cmp-nvim-lsp',
        },
        opts = function()
          -- luasnip setup
          local luasnip = require 'luasnip'

          -- nvim-cmp setup
          local cmp = require 'cmp'


          local check_backspace = function()
            local col = vim.fn.col(".") - 1
            return col == 0 or vim.fn.getline("."):sub(col,col):match("%s")
          end

          vim.g.copilot_assume_mapped = true
          cmp.setup {
            snippet = {
              expand = function(args)
                -- require('luasnip').lsp_expand(args.body)
              end,
            },
            mapping = {
              ['<C-p>'] = cmp.mapping.select_prev_item(),
              ['<C-n>'] = cmp.mapping.select_next_item(),
              ['<C-d>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.close(),
              ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              },
              ['<Tab>'] = function(fallback)
                local copilot_keys = vim.fn["copilot#Accept"]("")
                if cmp.visible() then
                  cmp.select_next_item()
                elseif copilot_keys ~= "" then
                  vim.api.nvim_feedkeys(copilot_keys,"i",false)
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end,
              ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end,
            },
            sources = {
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
              { name = 'buffer '}
            },
          }
              
        end

      },
  
}
