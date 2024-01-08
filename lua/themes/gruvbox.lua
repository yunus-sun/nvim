-- https://github.com/morhetz/gruvbox
-- NOTE: colorscheme
return {
    -- the colorscheme should be available when starting Neovim
    "morhetz/gruvbox",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
    -- load the colorscheme here
        vim.opt.background = "dark"
        vim.g.gruvbox_contrast_dark = "hard"
        vim.cmd([[colorscheme gruvbox]])
    end
}
