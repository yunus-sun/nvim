return {
    "mg979/vim-xtabline",
    enabled = false,
    lazy = false,
    -- FIX:
    -- how to disable the <F5> in xtabline?
    init = function()
        -- vim.g.xtabline_settings.enable_mappings = 0
        vim.keymap.set("n", "<F5>", "<NOP>")
    end,
    keys = function()
        vim.keymap.set("c", "xtm", "XTabMode<CR>")
    end,
}
