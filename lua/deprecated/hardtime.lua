-- ISSUE: limited usage and sometimes annoying
return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    enabled = false,
    config = function()
        require("hardtime").setup()
    end,
}
