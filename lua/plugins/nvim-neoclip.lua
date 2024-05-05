-- NOTE: it can also record the macros, it will be better to realize in a separate plugin?
return {
    "AckslD/nvim-neoclip.lua",
    enabled = true,
    lazy = true,
    dependencies = {
        { "nvim-telescope/telescope.nvim" },
        {'kkharji/sqlite.lua', module = 'sqlite'}
    },
    config = function()
        require('neoclip').setup({
            enable_persistent_history = true,
            enable_macro_history = false,
            -- ISSUE: this macro is less functional than NeoComposer. It's enough if familiar with the origin macros.
            on_select = {
                move_to_front = false,
                close_telescope = true,
            },
            on_paste = {
                set_reg = false,
                move_to_front = false,
                close_telescope = true,
            },
            keys = {
                telescope = {
                    i = {
                        select = '<cr>',
                        paste = '<c-p>',
                        paste_behind = '<c-k>',
                        replay = '<c-q>',  -- replay a macro
                        delete = '<c-d>',  -- delete an entry
                        edit = '<c-e>',  -- edit an entry
                        custom = {},
                    },
                    n = {
                        select = '<cr>',
                        paste = 'p',
                        paste_behind = 'P',
                        replay = 'q',
                        delete = 'd',
                        edit = 'e',
                        custom = {},
                    },
                },
            }
        })
    end,
    keys = {
        { "<leader>fc", "<cmd>Telescope neoclip<CR>", "n", { noremap = true, silent = true } },
    }
}
