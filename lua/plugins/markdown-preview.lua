return {
    "iamcco/markdown-preview.nvim",
    enabled = true,
    ft = "markdown",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        vim.g.mkdp_open_to_the_world = 1
        vim.g.mkdp_open_ip = '127.0.0.1'
        vim.g.mkdp_port = 8889
        vim.g.mkdp_browser = 'none'
        vim.g.mkdp_echo_preview_url = 1
    end,
}
