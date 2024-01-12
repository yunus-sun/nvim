-- FIX: some cases are disturbing.
return {
    "chrisgrieser/nvim-spider",
    enabled = false,
    lazy = false,
    keys = {
        {
            "e",
            "<cmd>lua require('spider').motion('e')<CR>",
            mode = { "n", "o", "x" },
        },
        {
            "w",
            "<cmd>lua require('spider').motion('w')<CR>",
            mode = { "n", "o", "x" },
        },
        {
            "b",
            "<cmd>lua require('spider').motion('b')<CR>",
            mode = { "n", "o", "x" },
        },
    },
    config = function()
        -- default values
        require("spider").setup {
            skipInsignificantPunctuation = true,
            subwordMovement = true,
            customPatterns = {}, -- check Custom Movement Patterns for details
        }
    end
}
