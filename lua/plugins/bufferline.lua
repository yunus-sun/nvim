-- local bufferline = require('bufferline')
return {
    'akinsho/bufferline.nvim',
    enabled = true,
    lazy = true,
    -- event = "BufWinEnter",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
                mode = "tabs", -- buffers | tabs
                style_preset = bufferline.style_preset.no_italic,
                numbers = 'ordinal',
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end
            }
        }
    end,
    keys = {
        -- NOTE: buffer related remaps are no need, because :bd :bp, :bn are quite easy!
        { "<leader>tn", "<cmd>tabnew<CR>", { noremap = true, desc = "Open a new tab" } },
        { "<leader>tc", "<cmd>tabclose<CR>", { noremap = true, desc = "Close a new tab" } },
        { "<leader>th", "<cmd>tabprevious<CR>", { noremap = true, desc = "Go to the previous tab" } },
        { "<leader>tl", "<cmd>tabnext<CR>", { noremap = true, desc = "Go to the next tab" } },
    }
}
