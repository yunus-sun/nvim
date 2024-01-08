-- FIX: must disable the nvim-treesitter in latex files, it can work in the math mode.
return{
    "yunus-sun/luasnip-latex-snippets.nvim",
    enabled = true,
    lazy = false,
    dependence = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    init = function ()
        require'luasnip-latex-snippets'.setup(
            { allow_on_markdown = true, }
            -- { use_treesitter = true }
        )
        require("luasnip").config.setup { enable_autosnippets = true }
    end
}
