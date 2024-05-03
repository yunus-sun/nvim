-- ISSUE: replaced by nvim-surround

-- return {
--     "ur4ltz/surround.nvim",
--     event = "BufRead",
--     config = function()
--         require("surround").setup({ mappings_style = "surround" })
--     end,
-- }


-- FIX:
-- 没有在单词周围添加括号的功能
--
-- https://github.com/ggandor/leap.nvim/discussions/59

-- How do I surround without adding a space?
-- Only the opening brackets—`[`, `{`, and `(`—add a space. Use a closing bracket, or the `b` (`(`) and `B` (`{`) aliases.
return{
    'tpope/vim-surround',
    enabled = false,
    event = 'BufRead',
    dependencies = {
        'tpope/vim-repeat',
    },
    keys = {
        { "gsr", "<Plug>Csurround", desc = "change surrounding #1 by #2" },
        { "gsd", "<Plug>Dsurround", desc = "delete surrounding #1" },
        { "gSr", "<Plug>CSurround", desc = "change surrounding #1 by #2 + new line" },
        { "gs", "<Plug>Ysurround", desc = "wraps #1 in #2 (surround)" },
        { "gS", "<Plug>YSurround", desc = "wraps #1 in #2 (surround) + new line" },
        { "gsgs", "<Plug>Yssurround", desc = "wraps line in #1 (surround)" },
        { "gSgS", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
        { "gSgs", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
        { "gs", "<Plug>VSurround", desc = "wraps visual selection in #1 (surround)", mode = "x" },
        { "gS", "<Plug>VgSurround", desc = "wraps visual selection in #1 (surround) + new line", mode = "x" },
    },
    init = function()
        vim.g.surround_no_mappings = 1
    end
}

-- NOTE:
-- https://github.com/ggandor/leap.nvim/discussions/38
-- https://github.com/ggandor/lightspeed.nvim/discussions/83
-- New settings for no conflict with leap.nvim
-- FIX:
-- use vim-sandwich instead of surround.nvim?

-- return{
--     'tpope/vim-surround',
--     keys = {
--         -- Just the defaults copied here.
--         { "cs", "<Plug>Csurround", desc = "change surrounding #1 by #2" },
--         { "ds", "<Plug>Dsurround", desc = "delete surrounding #1" },
--         { "cS", "<Plug>CSurround", desc = "change surrounding #1 by #2 + new line" },
--         { "ys", "<Plug>Ysurround", desc = "wraps #1 in #2 (surround)" },
--         { "yS", "<Plug>YSurround", desc = "wraps #1 in #2 (surround) + new line" },
--         { "yss", "<Plug>Yssurround", desc = "wraps line in #1 (surround)" },
--         { "ySs", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
--         { "ySS", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
--         -- The conflicting ones. Note that `<Plug>(leap-cross-window)`
--         -- _does_ work in Visual mode, if jumping to the same buffer,
--         -- so in theory, `gs` could be useful for Leap too...
--         { "gs", "<Plug>VSurround", desc = "wraps visual selection in #1 (surround)", mode = "x" },
--         { "gS", "<Plug>VgSurround", desc = "wraps visual selection in #1 (surround) + new line", mode = "x" },
--     },
--     init = function()
--         vim.g.surround_no_mappings = 1
--     end
-- }
