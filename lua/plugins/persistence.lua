return {
    "folke/persistence.nvim",
    enabled = true,
    lazy = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
        require("persistence").setup {
            dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
            -- minimum number of file buffers that need to be open to save
            -- Set to 0 to always save
            need = 1,
            branch = true, -- use git branch to save session
            -- options = { "buffers", "curdir", "tabpages", "winsize" }
        }
    end,
    keys = {
        { "<leader>qs", function() require("persistence").load() end, desc = "Load session for current directory" },
        { "<leader>qS", function() require("persistence").select() end, desc = "Select session to load" },
        { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Load last session" },
        { "<leader>qd", function() require("persistence").stop() end, desc = "Stop Persistence" },
        {
            "<leader>qD",
            function()
                local M = require("persistence")
                local sfile = M.current()
                if sfile and vim.loop.fs_stat(sfile) ~= 0 then
                    M.stop()
                    vim.fn.system("rm " .. vim.fn.fnameescape(sfile))
                end
            end,
            desc = "Delete Current Session"
        },
    }
}
