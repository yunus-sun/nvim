-- Add a dictionary: https://github.com/uga-rosa/cmp-dictionary/wiki/Examples-of-usage
-- sudo aspell -d en dump master | aspell -l en expand > ~/nvim-cmp-dict.dict
local dict = {
    ["*"] = { "~/nvim-cmp-dict.dict" },
    -- ft = {
    --     foo = { "/path/to/foo.dict" },
    -- },
}
return {
    "uga-rosa/cmp-dictionary",
    enabled = true,
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("cmp_dictionary").setup({
            paths = dict["*"],
            exact_length = 2,
            first_case_insensitive = true,
            document = {
                enable = true,
                command = { "wn", "${label}", "-over" },
            },
            -- sqlite = false,
            -- max_number_items = -1,
            -- capacity = 5,
            -- debug = false,
        })

        -- vim.api.nvim_create_autocmd("FileType", {
        --     pattern = "*",
        --     callback = function(ev)
        --         local paths = dict.ft[ev.match] or {}
        --         vim.list_extend(paths, dict["*"])
        --         require("cmp_dictionary").setup({
        --             paths = paths,
        --         })
        --     end
        -- })
    end
}
