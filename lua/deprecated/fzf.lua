-- TODO: check it
return {
    "junegunn/fzf.vim",
    enabled = false,
    ft = 'tex', -- FIX: only for citation completion in tex files
    -- build = "-> fzf#install()",
    build = function()
    vim.cmd([[
        -> fzf#install()
    ]])
    end,
    dependencies = "junegunn/fzf.vim",
    config = function()
        -- multiline will be wrong
        require('flit').setup{ keys = { f = 'f', F = 'F', t = 't', T = 'T' }, labeled_modes = "v", multiline = true, opts = {} }
    end
}
