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
    end,
    config = function()
        -- NOTE: Beautify
        local dap_breakpoint_color = {
            breakpoint = {
                ctermbg=0,
                fg='#993939',
                bg='#31353f',
            },
            logpoing = {
                ctermbg=0,
                fg='#61afef',
                bg='#31353f',
            },
            stopped = {
                ctermbg=0,
                fg='#98c379',
                bg='#31353f'
            },
        }
        vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
        vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
        vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)
        local dap_breakpoint = {
            error = {
                text = "",
                texthl = "DapBreakpoint",
                linehl = "DapBreakpoint",
                numhl = "DapBreakpoint",
            },
            condition = {
                text = 'ﳁ',
                texthl = 'DapBreakpoint',
                linehl = 'DapBreakpoint',
                numhl = 'DapBreakpoint',
            },
            rejected = {
                text = "",
                texthl = "DapBreakpint",
                linehl = "DapBreakpoint",
                numhl = "DapBreakpoint",
            },
            logpoint = {
                text = '',
                texthl = 'DapLogPoint',
                linehl = 'DapLogPoint',
                numhl = 'DapLogPoint',
            },
            stopped = {
                text = '',
                texthl = 'DapStopped',
                linehl = 'DapStopped',
                numhl = 'DapStopped',
            },
        }
        vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
        vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
        vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
        vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
        vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

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
        vim.keymap.set('n', '<LEADER>dd', function() require('dap').continue() end),
        vim.keymap.set('n', '<LEADER>dj', function() require('dap').step_over() end),
        vim.keymap.set('n', '<LEADER>dl', function() require('dap').step_into() end),
        vim.keymap.set('n', '<LEADER>dh', function() require('dap').step_out() end),
        vim.keymap.set('n', '<Leader>dt', function() require('dap').toggle_breakpoint() end),
        -- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end),
        vim.keymap.set('n', '<Leader>dT', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end),
        vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end),
        vim.keymap.set('n', '<Leader>dk', function() require('dap').run_last() end),
        vim.keymap.set({'n', 'v'}, '<Leader>dv', function()
            require('dap.ui.widgets').hover()
        end),
        vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
            require('dap.ui.widgets').preview()
        end),
        vim.keymap.set('n', '<Leader>df', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end),
        vim.keymap.set('n', '<Leader>ds', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end),
    }
}
