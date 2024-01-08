-- NOTE: move to luasnip.
return {
    "sirver/ultisnips",
    enabled = false,
    dependencies = { "yunus-sun/vim-snippets" },
    ft = { "tex", "markdown", "python", "mathtex", "snippets", "vim" },
    config = function()
        vim.g.UltiSnipsExpandTrigger = '<tab>'
        vim.g.UltiSnipsListSnippets = '<C-tab>'
        -- vim.g.UltiSnipsJumpForwardTrigger = '<C-l>'
        -- vim.g.UltiSnipsJumpBackwardTrigger = '<C-h>'
        vim.g.UltiSnipsJumpForwardTrigger = '<C-j>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<C-k>'

        vim.g.UltiSnipsEditSplit="vertical"
    end
}
