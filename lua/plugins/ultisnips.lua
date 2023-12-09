return {
    "sirver/ultisnips",
    enabled = true,
    dependencies = { "yunus-sun/vim-snippets" },
    ft = { "tex", "markdown", "python", "mathtex", "snippets", "vim" },
    config = function()
        vim.g.UltiSnipsExpandTrigger = '<tab>'
        vim.g.UltiSnipsListSnippets = '<C-tab>'
        vim.g.UltiSnipsJumpForwardTrigger = '<C-l>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<C-h>'

        vim.g.UltiSnipsEditSplit="vertical"
    end
}
