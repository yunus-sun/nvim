-- BUG: 1. <esc> cannot quit when f/t
-- 2. 't' with problem when highlight
-- TODO: integerate with telescope
return {
    "folke/flash.nvim",
    enabled = true,
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        modes = {
            -- f,t,F,T with labels
            char = {
                enabled = true,
                jump_labels = true
            },
        },
    },
    -- stylua: ignore
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}
