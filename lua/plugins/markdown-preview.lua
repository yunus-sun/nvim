return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    -- build = "cd app && npm install", -- npm will be wrong!
    ft = "markdown",
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
}
