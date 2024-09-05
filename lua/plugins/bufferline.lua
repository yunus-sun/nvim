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
        { "<leader>tH", "<cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, desc = "Go to the buffer 1" } },
        { "<leader>tL", "<cmd>BufferLineGoToBuffer -1<CR>", { noremap = true, desc = "Go to the buffer -1" } },

        { "<leader>tg1", "<cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, desc = "Go to the buffer 1" } },
        { "<leader>tg2", "<cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, desc = "Go to the buffer 2" } },
        { "<leader>tg3", "<cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, desc = "Go to the buffer 3" } },
        { "<leader>tg4", "<cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, desc = "Go to the buffer 4" } },
        { "<leader>tg5", "<cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, desc = "Go to the buffer 5" } },
        { "<leader>tg6", "<cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, desc = "Go to the buffer 6" } },
        { "<leader>tg7", "<cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, desc = "Go to the buffer 7" } },
        { "<leader>tg8", "<cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, desc = "Go to the buffer 8" } },
        { "<leader>tg9", "<cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, desc = "Go to the buffer 9" } },
    }
}
