-- TODO: https://blog.csdn.net/qq_19078137/article/details/125694657 seems to be a good example
-- BUG: why lsp cannot start automatically?
return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
        },
        enabled = true,
        lazy = false,
        build = ":MasonUpdate",
        config = function()
            require('mason').setup()
            require('mason-tool-installer').setup {
                ensure_installed = {
                    'bash-language-server',
                    'lua-language-server',
                    'marksman', -- for markdown
                    'markdown-toc',
                    'prettier',
                    'pyright',
                    'ruff-lsp', -- python formatter
                    'black', -- python formatter
                    'texlab', -- for latex
                    'ltex-ls', -- for text, md, tex
                },
                auto_update = true,
                run_on_start = true,
                start_delay = 3000, -- 3 second delay
                debounce_hours = 5, -- at least 5 hours between attempts to install/update
            }
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- local other_servers = { "pyright", "ruff_lsp", "lua_ls", "marksman", "dockerls", "bashls", "texlab", "ltex" }
            local other_servers = { "pyright", "lua_ls", "marksman", "dockerls", "bashls", "texlab", "ltex" }
            for _, server in ipairs(other_servers) do
                lspconfig[server].setup {
                    capabilities = capabilities,
                }
            end

            lspconfig["texlab"].setup{
                -- NOTE: There is a bug when chinese refs are in bib files (unicode error)

                root_dir = lspconfig.util.root_pattern("*tex", vim.fn.getcwd()),
            }

            lspconfig["ltex"] = {
                -- java is needed: sudo apt install openjdk-11-jdk
                default_config = {
                    root_dir = function(filename)
                        return util.path.dirname(filename)
                    end;
                    settings = {
                        ltex = {
                            checkFrequency="save",
                            language = "en",
                        }
                    }
                }
            }

            -- FIX: seems not working
            -- lspconfig["latexindent"] = {
            -- }

            -- lspconfig.ruff_lsp.setup {}
            -- pylance has some issues in neovim, like not report importMissing.
            -- local pylance = "/home/ch4ser/Tools/Other/pylance/server.bundle.js"
            -- if vim.fn.filereadable(pylance) ~= 0 then
            --     lspconfig.pyright.setup {
            --         capabilities = capabilities,
            --         cmd = { "node", pylance, "--stdio" },
            --     }
            -- else
            --     lspconfig.pyright.setup {
            --         capabilities = capabilities,
            --     }
            -- end
        end,
        event = 'BufRead',
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier, -- TODO: work with aforemetioned parts?
                    null_ls.builtins.formatting.black,
                },
            })
        end,
        event = 'BufRead',
    },
}
