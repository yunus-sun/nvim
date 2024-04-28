-- BUG: cannot display image for WSL, due to there is no X11.
return{
    "benlubas/molten-nvim",
    enabled = true,
    lazy = true,
    ft = {'python'},
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ':UpdateRemotePlugins', -- By manual?
    dependencies = {
        {"3rd/image.nvim", opt = true},
    },
    init = function()
        -- this is an example, not a default. Please see the readme for more configuration options
        vim.g.molten_output_win_max_height = 12
    end,
    config = function()
    end,
    keys = function()
        vim.keymap.set("n", "<Leader>ri", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
        vim.keymap.set("n", "<Leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
        vim.keymap.set("n", "<Leader>ro", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
        vim.keymap.set("n", "<Leader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
        vim.keymap.set("v", "<Leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "evaluate visual selection" })
        vim.keymap.set("n", "<Leader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
        vim.keymap.set("n", "<Leader>rh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
        vim.keymap.set("n", "<Leader>rs", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show/enter output" })
    end
}
