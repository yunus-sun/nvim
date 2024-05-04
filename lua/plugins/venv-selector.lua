-- NOTE:
-- `sudo apt install fd-find` is needed.
return {
    'linux-cultist/venv-selector.nvim',
    enabled = true,
    lazy = true,
    dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-telescope/telescope.nvim',
        'mfussenegger/nvim-dap-python',
    },
    config = function()
        require('venv-selector').setup {
            search = false,
            fd_binary_name = 'fdfind',

            -- nvim-dap:
            dap_enabled = true,

            -- Conda:
            anaconda_base_path = os.getenv('HOME') .. '/miniconda3',
            anaconda_envs_path = os.getenv('HOME') .. '/miniconda3/envs',
            enable_debug_output = false, -- for debug
        }
    end,
    cmd = {'VenvSelect'},
    keys = {
        -- NOTE: cmd may be preferred to keys. (but keys is empty now)

        -- Keymap to open VenvSelector to pick a venv.
        { '<leader>vs', '<cmd>VenvSelect<cr>' },
        -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
        { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
}
