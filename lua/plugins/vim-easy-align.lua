-- NOTE:
-- ONLY VALID FOR:
-- `<Space>`, `=`, `:`, `.`, `|`, `&`, `#`, and `,`.
return {
    "junegunn/vim-easy-align",
    enabled = false,
    keys = {
        -- Start interactive EasyAlign in visual mode (e.g. vipga)
        { "ga", "<Plug>(EasyAlign)", "x", { noremap = false, silent = true } },
        -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
        { "ga", "<Plug>(EasyAlign)", "n", { noremap = false, silent = true } },
    }
}
