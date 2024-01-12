-- NOTE: tutorial: https://zjp-cn.github.io/neovim0.6-blogs/nvim/luasnip/doc1.html
-- TODO: how to define or modifiy the snippets?
return{
    'L3MON4D3/LuaSnip',
    enabled = true,
    lazy = false,
    -- ft = { "tex", "markdown", "python", "mathtex", "snippets", "vim" },
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp", -- install jsregexp (optional!).
    dependencies = { "yunus-sun/friendly-snippets" },
    config = function()
        -- NOTE: Local define
        local ls = require "luasnip"
        local s = ls.snippet
        local sn = ls.snippet_node
        local isn = ls.indent_snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local events = require "luasnip.util.events"
        local ai = require "luasnip.nodes.absolute_indexer"
        local extras = require "luasnip.extras"
        local fmt = extras.fmt
        local m = extras.m
        local l = extras.l
        local postfix = require "luasnip.extras.postfix".postfix

        -- NOTE: Keybinding
        -- FIX: combine it into nvim-cmp, so the followings are deprecated.
        -- vim.keymap.set({"i"}, "<tab>", function() ls.expand() end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump( 1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})

        -- NOTE: Snippet: config for friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()
        -- FIX: seems automatically load the rafamadriz/friendly-snippets
        -- TODO:
        -- load snippets from path/of/your/nvim/config/my-cool-snippets
        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
    end
}
