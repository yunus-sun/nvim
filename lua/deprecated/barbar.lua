-- ISSUE: seems only have buffer display mode, which violate the buffer design in vim.
return {'romgrk/barbar.nvim',
    enabled = false,
    lazy = false,
    -- event = "BufWinEnter",
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = true
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    config = function ()

    end
}
