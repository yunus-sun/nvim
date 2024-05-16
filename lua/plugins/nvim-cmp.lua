return{
    "hrsh7th/nvim-cmp",
    enabled = true,
    lazy = true,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "micangl/cmp-vimtex",
        "zbirenbaum/copilot-cmp",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-omni",
        "uga-rosa/cmp-dictionary",
        "chrisgrieser/cmp_yanky",
    },
    init = function()
        local cmp = require("cmp")
        vim.opt.completeopt = { "menu", "menuone", "noselect" }
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
                ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
                ["<C-h>"] = cmp.mapping.scroll_docs(-4),
                ["<C-l>"] = cmp.mapping.scroll_docs(4),
                -- ["<C-Space>"] = cmp.mapping.complete(), -- The following configuration defines a key mapping to show completion only for vsnip snippets.
                ["<C-u>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
        })
    end,
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" }, -- For luasnip users.
                -- { name = "orgmode" },
                { name = "buffer", option = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end
                }},
                { name = "path" },
                { name = "vimtex"}, -- for latex
                -- { name = "ultisnips" },
                { name = "copilot" },
                { name = "omni", trigger_characters = { "{", "\\" }, option = {
                    disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' }
                }}, -- FIX: seems doesn't work!
                { name = "dictionary", keyword_length = 2 }, -- BUG: need to further config.
                -- { name = "zotex" }, -- BUG: seems some bugs
                { name = "cmp_yanky", option = {
                    -- only suggest items which match the current filetype
                    onlyCurrentFiletype = false,
                    -- only suggest items with a minimum length
                    minLength = 3,
                }}, -- gbprod/yanky.nvim is needed
            }),
            formatting = {
                -- NOTE: config in lspkin.lua
                -- format = lspkind.cmp_format({
                --     mode = 'symbol', -- show only symbol annotations
                --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                --     -- The function below will be called before any actual modifications from lspkind
                --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                --     symbol_map = { Copilot = "" },
                --     before = function (entry, vim_item)
                --         return vim_item
                --     end
                -- })
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
