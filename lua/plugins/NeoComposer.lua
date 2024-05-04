-- NOTE: qa is not active when using this plugin
return {
    "ecthelionvi/NeoComposer.nvim",
    enabled = true,
    lazy = true,
    dependencies = { "kkharji/sqlite.lua" },
    opts = {
        notify = true,
        delay_timer = 150,
        queue_most_recent = false,
        keymaps = {
            play_macro = "qp",
            yank_macro = "qy",
            stop_macro = "qc",
            toggle_record = "qq",
            cycle_next = "qj",
            cycle_prev = "qk",
            toggle_macro_menu = "qm",
        },
    },
    keys = {
        { "qd", "<cmd>ToggleDelay<CR>", "n", { noremap = true, silent = true } },
    }
}
