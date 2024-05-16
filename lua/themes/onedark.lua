return {
    -- the colorscheme should be available when starting Neovim
    "navarasu/onedark.nvim",
    enabled = true,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            desc = "Prevent colorscheme clearing self-defined DAP marker colors",
            callback = function()
                -- Reuse current SignColumn background (except for DapStoppedLine)
                local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
                -- if bg or ctermbg aren't found, use bg = 'bg' (which means current Normal) and ctermbg = 'Black'
                -- convert to 6 digit hex value starting with #
                local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
                local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'

                vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ff00', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
                vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d', ctermbg = 'Green' })
                vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#c23127', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
                vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#888ca6', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
                vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
            end
        })

        -- load the colorscheme here
        vim.cmd([[colorscheme onedark]])
        -- configurations
        -- NOTE: cancel it for coloring the line within git plugins, and this function is less meaningful
        --
        -- Sets colors to line numbers Above, Current and Below  in this order
        -- function LineNumberColors()
        --     vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
        --     vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow', bold=true })
        --     vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
        -- end
        -- LineNumberColors()
        require('onedark').setup  {
            -- Main options --
            style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false,  -- Show/hide background
            term_colors = true, -- Change terminal color as per the selected theme style
            ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
            cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

            -- toggle theme style ---
            toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
            toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

            -- Change code style ---
            -- Options are italic, bold, underline, none
            -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
            code_style = {
                comments = 'italic',
                keywords = 'none',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            },

            -- Lualine options --
            lualine = {
                transparent = false, -- lualine center bar transparency
            },

            -- Custom Highlights --
            colors = {}, -- Override default colors
            highlights = {}, -- Override highlight groups

            -- Plugins Config --
            diagnostics = {
                darker = true, -- darker colors for diagnostic
                undercurl = true,   -- use undercurl instead of underline for diagnostics
                background = true,    -- use background color for virtual text
            },
        }
    end
}
