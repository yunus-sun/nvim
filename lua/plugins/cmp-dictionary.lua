-- Add a dictionary: https://github.com/uga-rosa/cmp-dictionary/wiki/Examples-of-usage
-- sudo aspell -d en dump master | aspell -l en expand > /home/yunus/nvim-cmp-dict.dict
return {
    "uga-rosa/cmp-dictionary",
    enabled = true,
    lazy = false,
    config = function()
        require("cmp_dictionary").setup({
            -- The following are default values.
            exact = 2,
            first_case_insensitive = false,
            document = false,
            document_command = "wn %s -over",
            sqlite = false,
            max_items = -1,
            capacity = 5,
            debug = false,
        })

        require("cmp_dictionary").switcher({
            -- filetype = {
            --     lua = "/path/to/lua.dict",
            --     javascript = { "/path/to/js.dict", "/path/to/js2.dict" },
            -- },
            -- filepath = {
            --     [".*xmake.lua"] = { "/path/to/xmake.dict", "/path/to/lua.dict" },
            --     ["%.tmux.*%.conf"] = { "/path/to/js.dict", "/path/to/js2.dict" },
            -- },
            spelllang = {
                en = "/home/yunus/nvim-cmp-dict.dict",
            },
        })
    end
}
