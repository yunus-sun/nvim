-- ISSUE: replaced by flash.nvim
return {
    "ggandor/flit.nvim",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    config = function()
        -- multiline will be wrong
        require('flit').setup{ keys = { f = 'f', F = 'F', t = 't', T = 'T' }, labeled_modes = "v", multiline = true, opts = {} }
    end
}
