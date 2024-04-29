-- FIX: conflict with tabout, and it plays a limited role
return{
    "vidocqh/auto-indent.nvim",
    enabled = false,
    lazy = false,
    event = { "InsertEnter" }, -- TODO: should I use it?
    config = function ()
        require("auto-indent").setup({
            lightmode = true,        -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
            -- indentexpr = nil,        -- Use vim.bo.indentexpr by default, see 'Custom Indent Evaluate Method'
            indentexpr = function(lnum)
                return require("nvim-treesitter.indent").get_indent(lnum)
            end,
            ignore_filetype = {},    -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
        })
    end
}
