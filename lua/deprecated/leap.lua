-- NOTE: Fast moving.

return {
    "ggandor/leap.nvim",
    enabled = false,
    lazy = false,
    config = function()
        -- Mapping operate symbols
        -- require('leap').create_default_mappings()
        vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward-to)')
        vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward-to)')
        vim.keymap.set({'n', 'x', 'o'}, 'gf', '<Plug>(leap-from-window)')

        vim.keymap.set({'n', 'x', 'o'}, 't', '<Plug>(leap-forward-till)')
        vim.keymap.set({'n', 'x', 'o'}, 'T', '<Plug>(leap-backward-till)')

        -- Disable auto-jumping to the first match
        require('leap').opts.safe_labels = {}
    end
}
