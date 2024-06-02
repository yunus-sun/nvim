return {
    "stevearc/aerial.nvim",
    enabled = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        require("aerial").setup({
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
            attach_mode = "window",
            -- close_automatic_events = { "unfocus", "switch_buffer"},
            autojump = true,
        })
    end,
    keys = {
        -- You probably also want to set a keymap to toggle aerial
        {"<leader>a", "<cmd>AerialToggle!<CR>", "n", {noremap = true, silent = true}},
    }
}
