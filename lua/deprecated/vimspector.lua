-- ISSUE: replaced by nvim-dap

-- FIX:
-- Refer to: https://www.cnblogs.com/kongj/p/12831690.html
-- https://github.com/puremourning/vimspector
-- https://github.com/theniceboy/nvim/blob/master/sample_vimspector_json/python.json
-- https://blog.csdn.net/fantastic9/article/details/120919300
-- https://puremourning.github.io/vimspector-web/
-- https://dev.to/iggredible/debugging-in-vim-with-vimspector-4n0m
return {
    "puremourning/vimspector",
    -- init = function()
    --     vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'
    -- end
    enabled = false,
    keys = {
        { "<LEADER>dd", "<CMD>call vimspector#Launch()<CR>", "n", { noremap = true, silent = true } },
        { "<LEADER>dd", "<CMD>call vimspector#Continue()<CR>", "n", { noremap = true, silent = true } },
        { "<LEADER>dr", "<CMD>call vimspector#Reset()<CR>", "n", { noremap = true, silent = true } },

        { "<LEADER>dt", "<CMD>call vimspector#ToggleBreakpoint()<CR>", "n", { noremap = true, silent = true } },
        { "<LEADER>dc", "<CMD>call vimspector#ClearBreakpoints()<CR>", "n", { noremap = true, silent = true } },

        { "<LEADER>dk", "<Plug>VimspectorRestart", "n", { noremap = false, silent = true } },
        { "<LEADER>dh", "<Plug>VimspectorStepOut", "n", { noremap = false, silent = true } },
        { "<LEADER>dl", "<Plug>VimspectorStepInto", "n", { noremap = false, silent = true } },
        { "<LEADER>dj", "<Plug>VimspectorStepOver", "n", { noremap = false, silent = true } },
    }
}
