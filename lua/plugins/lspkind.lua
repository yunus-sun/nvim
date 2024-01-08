return{
    "onsails/lspkind.nvim",
    enabled = true,
    lazy = false,
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        cmp.setup {
            formatting = {
                format = lspkind.cmp_format({
                    -- defines how annotations are shown
                    -- default: symbol
                    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                    mode = 'symbol_text',

                    -- default symbol map
                    -- can be either 'default' (requires nerd-fonts font) or
                    -- 'codicons' for codicon preset (requires vscode-codicons font)
                    --
                    -- default: 'default'
                    preset = 'codicons',
                    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- can also be a function to dynamically calculate max width such as
                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    maxwidth = 50,

                    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    ellipsis_char = '...',

                    -- override preset symbols
                    --
                    -- default: {}
                    -- NOTE: seems to have default config here.
                    symbol_map = {
                        Copilot = "",
                    },

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function (entry, vim_item)
                        -- Source 显示提示来源
                        vim_item.menu = "["..string.upper(entry.source.name).."]"
                        return vim_item
                    end
                })
            }
        }
    end
}
