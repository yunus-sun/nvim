return{
    "kylechui/nvim-surround",
    enabled = true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    init = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults

            -- change 's' to '-'
            -- vim.keymap.set({'i'}, '<C-g>-', '<Plug>(nvim-surround-insert)'),
            -- vim.keymap.set({'i'}, '<C-g>_', '<Plug>(nvim-surround-insert-line)'),
            -- vim.keymap.set({'n'}, 'y-', '<Plug>(nvim-surround-normal)'),
            -- vim.keymap.set({'n'}, 'y--', '<Plug>(nvim-surround-normal-cur)'),
            -- vim.keymap.set({'n'}, 'y_', '<Plug>(nvim-surround-normal-line)'),
            -- vim.keymap.set({'n'}, 'y__', '<Plug>(nvim-surround-normal-cur-line)'),
            -- vim.keymap.set({'x'}, '_', '<Plug>(nvim-surround-visual)'),
            -- vim.keymap.set({'x'}, 'g_', '<Plug>(nvim-surround-visual-line)'),
            -- vim.keymap.set({'n'}, 'd-', '<Plug>(nvim-surround-delete)'),
            -- vim.keymap.set({'n'}, 'c-', '<Plug>(nvim-surround-change)'),
            -- vim.keymap.set({'n'}, 'c_', '<Plug>(nvim-surround-change-line)'),
        })
    end
}
