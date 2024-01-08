-- NOTE: rely on tresitter
-- FIX: don't work in latex, due to disable treesitter.
return{
    "abecodes/tabout.nvim",
    enabled = true,
    lazy = true,
    dependencies = {"nvim-treesitter"},
    event = "InsertEnter",
    config = function()
        require('tabout').setup {
            tabkey = '<Tab>',
            backwards_tabkey = '<S-Tab>',
            act_as_tab = true,
            act_as_shift_tab = true,
            enable_backwards = true,
            completion = true, -- true, if the tabkey is used in a completion pum
            tabouts = {
                {open = "'", close = "'"},
                {open = '"', close = '"'},
                {open = '`', close = '`'},
                {open = '(', close = ')'},
                {open = '[', close = ']'},
                {open = '{', close = '}'}
            },
            ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            exclude = {} -- tabout will ignore these filetypes
        }
    end,
}
