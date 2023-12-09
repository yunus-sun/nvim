return {
    "preservim/vim-markdown",
    enabled = true,
    dependencies = {
        "godlygeek/tabular"
    },
    ft = "markdown",
    config = function()
        -- syntax concealing
        vim.opt.conceallevel=2
        vim.g.tex_conceal = ""
        vim.g.vim_markdown_math = 1

        vim.g.mkdp_markdown_css = ''
        vim.g.vim_markdown_frontmatter = 1
        vim.g.vim_markdown_new_list_item_indent = 2
    end,
}
