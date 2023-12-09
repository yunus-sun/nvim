return {
    "mfussenegger/nvim-dap-python",
    enabled = true,
    dependencies = {"mfussenegger/nvim-dap"},
    config = function()
        -- function pythonPathfunction()
        --     -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
        --     -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
        --     -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
        --     local cwd = vim.fn.getcwd()
        --     local cwd = vim.fn.getcwd()
        --     if vim.fn.executable(cwd .. '/.venv/Scripts/python.exe') == 1 then
        --         local pythonPath = '/.venv/Scripts/python.exe'
        --     else
        --         local pythonPath = 'D:/Software/Miniconda/python.exe'
        --     end
        -- end;
        -- pythonPathfunction()
        require('dap-python').setup('')
    end,
}
