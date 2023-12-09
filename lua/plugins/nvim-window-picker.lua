-- FIX: BUG on s1n7ax/nvim-window-picker
return {
    "t9md/vim-choosewin",
    enabled = true,
    keys = {
        {"<leader>ss", "<Plug>(choosewin)", "n", {noremap = true, silent = true}},
    },
    config = function()
        -- if you want to use overlay feature
        -- vim.g.choosewin_overlay_enable = 1
    end
}
