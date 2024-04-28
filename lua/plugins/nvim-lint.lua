return {
    "mfussenegger/nvim-lint",
    enabled = true,
    lazy = true,
    event = "BufWritePre",
    config = function ()
        require('lint').linters_by_ft = {
            python = {'flake8',},
            -- markdown = {'vale',}
        }
    end,
}
