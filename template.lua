-- TODO: Compelete it!
local opts = {noremap = true, silent = true}

return {
    "plugin name",
    lazy = boolean?,
    enabled = boolean?_or_fun():boolean,
    cond = boolean?_or_fun():boolean,
    dependencies = {
        "plugins name",
    },
    init = function()
        --
    end,
    opts =
    config = function()
        require("plugin name").setup({
            --
        })
    end,
    event =
    cmd =
    ft =
    keys = {
        { "original key", "mapped key", "mode", opts },
    },
    priority =
}
