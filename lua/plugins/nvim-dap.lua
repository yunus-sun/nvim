-- https://github.com/mfussenegger/nvim-dap
-- NOTE: Debug Adapter Protocol
return {
    "mfussenegger/nvim-dap",
    enabled = true,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "mfussenegger/nvim-dap-python",
        -- "Pocco81/DAPInstall.nvim",
    },
    -- FIX: pop cmd windows
    init = function()
        local dap=require('dap')
        dap.defaults.python.terminal_win_cmd = 'belowright new'

        vim.api.nvim_create_user_command("RunScriptWithArgs", function(t)
            -- :help nvim_create_user_command
            -- args = vim.split(vim.fn.expand(t.args), '\n')
            args = vim.fn.split(t.args, ' ')
            approval = vim.fn.confirm(
                "Will try to run:\n    " ..
                vim.bo.filetype .. " " ..
                vim.fn.expand('%') .. " " ..
                t.args .. "\n\n" ..
                "Do you approve? ",
                "&Yes\n&No", 1
            )
            if approval == 1 then
                dap.run({
                    type = vim.bo.filetype,
                    request = 'launch',
                    name = 'Launch file with custom arguments (adhoc)',
                    program = '${file}',
                    args = args,
                })
            end
        end, {
            complete = 'file',
            nargs = '*'
        })
    end,
    config = function()
        -- NOTE: Beautify dap point
        -- ISSUE: need to define twice: in colors.lua and here
        -- refer to https://github.com/mfussenegger/nvim-dap/issues/1137
        -- https://github.com/mfussenegger/nvim-dap/discussions/355
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

        vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
        vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

        -- NOTE: Config for python
        -- TODO: How to configure for conda?
        local dap = require('dap')
        dap.adapters.python = {
            type = 'executable';
            -- command = '/usr/bin/python3';
            command = 'python3';
            args = { '-m', 'debugpy.adapter' };
        }
        dap.configurations.python = {
            {
                type = "python";
                request = "launch";
                name = "launch file";
                program = "${file}";
                pythonPath = function ()
                    return "python3"
                end
            },
        }

        -- NOTE: dap-ui
        local dap = require("dap")
        local dapui = require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
        end
    end,
    keys = {
        { "<leader>dR", "<cmd>!python3 %<CR>", "n", { noremap = true, silent = true } },
        { "<leader>dq", "<cmd>DapTerminate<CR>", "n", { noremap = true, silent = true } },
        vim.keymap.set('n', '<LEADER>dd', function() require('dap').continue() end, { silent = true, desc = "debug continue" }),
        vim.keymap.set('n', '<LEADER>dj', function() require('dap').step_over() end, { silent = true, desc = "debug step_over" }),
        vim.keymap.set('n', '<LEADER>dl', function() require('dap').step_into() end, { silent = true, desc = "debug step_into" }),
        vim.keymap.set('n', '<LEADER>dh', function() require('dap').step_out() end, { silent = true, desc = "debug step_out" }),
        vim.keymap.set('n', '<Leader>dt', function() require('dap').toggle_breakpoint() end, { silent = true, desc = "debug toggle_breakpoint" }),
        -- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end),
        vim.keymap.set('n', '<Leader>dT', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true, desc = "debug tb with log" }),
        vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { silent = true, desc = "debug open repl" }),
        vim.keymap.set('n', '<Leader>dk', function() require('dap').run_last() end, { silent = true, desc = "debug run_last" }),
        vim.keymap.set({'n', 'v'}, '<Leader>dv', function() require('dap.ui.widgets').hover() end, { silent = true, desc = "debug hover" }),
        vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end, { silent = true, desc = "debug preview" }),
        vim.keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end, { silent = true, desc = "debug float frame" }),
        vim.keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, { silent = true, desc = "debug float scope" }),
        vim.keymap.set('n', '<leader>da', ":RunScriptWithArgs "),
    }
}
