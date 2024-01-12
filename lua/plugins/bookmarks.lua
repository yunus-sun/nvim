-- crusj/bookmarks.nvim may worse than it.
return {
    'tomasky/bookmarks.nvim',
    enabled = true,
    lazy = true,
    -- event = "VimEnter", -- TODO: Can we make this plugin be loaded when the key is triggered?
    branch = 'main',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    keys = {
        { 'mm', "<cmd>lua require('bookmarks').bookmark_toggle()<CR>", "n", { noremap = true, silent = true } },
        { 'mi', "<cmd>lua require('bookmarks').bookmark_ann()<CR>", "n", { noremap = true, silent = true } },
        { 'mc', "<cmd>lua require('bookmarks').bookmark_clean()<CR>", "n", { noremap = true, silent = true } },
        { 'mj', "<cmd>lua require('bookmarks').bookmark_next()<CR>", "n", { noremap = true, silent = true } },
        { 'mk', "<cmd>lua require('bookmarks').bookmark_prev()<CR>", "n", { noremap = true, silent = true } },
        { 'ml', "<cmd>Telescope bookmarks list<CR>", "n", { noremap = true, silent = true } },
        -- { "<leader>fm", "<cmd>Telescope bookmarks list<CR>", "n", { noremap = true, silent = true } },
    },
    config = function()
        require('bookmarks').setup {
            -- sign_priority = 8,  --set bookmark sign priority to cover other sign
            save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
            keywords =  {
                ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
                ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
                ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
                ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
            },
            -- on_attach = function(bufnr)
            --     local bm = require "bookmarks"
            --     local map = vim.keymap.set
            --     map("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
            --     map("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
            --     map("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
            --     map("n","mj",bm.bookmark_next) -- jump to next mark in local buffer
            --     map("n","mk",bm.bookmark_prev) -- jump to previous mark in local buffer
            --     map("n","ml",bm.bookmark_list) -- show marked file list in quickfix window
            -- end
        }
        require("telescope").load_extension("bookmarks")
    end
}
