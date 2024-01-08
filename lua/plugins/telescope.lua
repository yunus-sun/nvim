-- refer to https://github.com/jyf-111/nvim/blob/master/lua/plugins/telescope.lua
-- many configuration need more exploration

-- Install:
-- 1. For fzf-native: https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- scoop install make & MinGW & fzf
-- 2. For sqlite: https://github.com/kkharji/sqlite.lua
-- sudo apt-get install sqlite3 libsqlite3-dev # Ubuntu
-- 3. https://github.com/jyf-111/nvim
-- 如果telescope的history有问题,需要手动创建telescope_history.json
-- touch vim.fn.stdpath "data" .. '/telescope_history.sqlite3

return {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-smart-history.nvim", dependencies = "kkharji/sqlite.lua" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        { "nvim-telescope/telescope-symbols.nvim" },
        { "GustavoKatel/telescope-asynctasks.nvim" },
    },
    init = function()
        -- https://github.com/nvim-telescope/telescope.nvim/issues/559#issuecomment-1074076011
        vim.api.nvim_create_autocmd("BufRead", {
            callback = function()
                vim.api.nvim_create_autocmd("BufWinEnter", {
                    once = true,
                    command = "normal! zx",
                })
            end,
        })
    end,
    keys = {
        { "<leader>f<leader>", "<cmd>Telescope <CR>", "n", { noremap = true, silent = true } },
        { "<leader>fk", "<cmd>Telescope keymaps <CR>", "n", { noremap = true, silent = true } },
        { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "n", { noremap = true, silent = true } },
        { "<leader>ff", "<cmd>Telescope find_files<CR>", "n", { noremap = true, silent = true } },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", "n", { noremap = true, silent = true } },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", "n", { noremap = true, silent = true } },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>", "n", { noremap = true, silent = true } },
        { "<leader>fm", "<cmd>Telescope marks<CR>", "n", { noremap = true, silent = true } },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", "n", { noremap = true, silent = true } },
        { "<leader>FB", "<cmd>Telescope file_browser<CR>", "n", { noremap = true, silent = true } },
        -- NOTE:
        -- 只有按键才能激活，所以无法使用tele命令
        { "<leader>fn", "<cmd>Telescope noice<CR>", "n", { noremap = true, silent = true } },
        {
            "<leader>fp",
            "<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
            "n",
            { noremap = true, silent = true, desc = "Telescope project" },
        },
        {
            "<leader>fe",
            "<cmd>lua require'telescope.builtin'.symbols{'nerd','emoji','gitemoji','julia'} <CR>",
            "n",
            { noremap = true, silent = true, desc = "Telescope symbols" },
        },
        {
            "<leader>fa",
            "<Cmd>Telescope asynctasks all theme=dropdown <CR>",
            "n",
            { noremap = true, silent = true, desc = "Telescope asynctasks" },
        },
        {
            "<leader>fd",
            "<cmd>lua require'telescope.builtin'.diagnostics{bufnr=0} <CR>",
            "n",
            { noremap = true, silent = true, desc = "Telescope diagnostics" },
        },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                border = true,
                winblend = 0,
                dynamic_preview_title = true,
                path_display = { "truncate" },
                theme = "ivy",
                layout_strategy = "bottom_pane",
                layout_config = {
                    bottom_pane = {
                        height = 0.5,
                        preview_cutoff = 120,
                        prompt_position = "bottom",
                    },
                    center = {
                        height = 0.4,
                        preview_cutoff = 40,
                        prompt_position = "top",
                        width = 0.9,
                    },
                    cursor = {
                        height = 0.9,
                        preview_cutoff = 40,
                        width = 0.8,
                    },
                    vertical = {
                        width = 0.9,
                        height = 0.9,
                    },
                    horizontal = {
                        width = 0.9,
                        height = 0.9,
                    },
                },
                history = {
                    path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
                    limit = 100,
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim",
                    "--no-ignore",
                    "--hidden",
                },
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                sorting_strategy = "descending",
                -- TODO: fitter
                file_ignore_patterns = {
                    "^node_modules",
                    "^.git",
                    ".cache",
                    "%.class",
                    "^build",
                    "doc",
                },
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
                        ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
                        ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
                        ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                        ["<C-q>"] = require("telescope.actions").smart_send_to_qflist
                        + require("telescope.actions").open_qflist,
                    },
                    n = {
                        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
                        ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
                        ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
                        ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
                    },
                    -- TODO: more customized mappings can be defined.
                },
            },
            pickers = {
                find_files = {
                    layout_strategy = "horizontal",
                    prompt_title = "   Find File",
                    layout_config = {
                        height = 0.95,
                        width = 0.95,
                        preview_cutoff = 80,
                    },
                },
                lsp_definitions = {
                    layout_strategy = "horizontal",
                    prompt_title = "   Find Definition",
                    layout_config = {
                        height = 0.95,
                        width = 0.95,
                        preview_cutoff = 80,
                    },
                    include_declaration = false,
                    include_current_line = false,
                    show_line = false,
                },
                lsp_references = {
                    layout_strategy = "horizontal",
                    prompt_title = "   LSP References",
                    layout_config = {
                        height = 0.95,
                        width = 0.95,
                        preview_cutoff = 80,
                    },
                    include_declaration = false,
                    include_current_line = false,
                    show_line = false,
                },
                file_browser = {
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        },
                    },
                },
                keymaps = {
                    prompt_title = "   Keymaps",
                },
                current_buffer_fuzzy_find = {
                    prompt_title = " ﬘  Current Buffer",
                },
                live_grep = {
                    prompt_title = "   Live Grep",
                    -- previewer = false,
                },
                help_tags = {
                    prompt_title = "  Help Tags",
                    layout_config = {
                        preview_cutoff = 0,
                    },
                },
                oldfiles = {
                    prompt_title = "   Old Files",
                },
                marks = {
                    prompt_title = "  Marks",
                },
                buffers = {
                    prompt_title = " ﬘ Buffers",
                    layout_config = {
                        preview_cutoff = 0,
                    },
                },
                diagnostics = {
                    previewer = false,
                    layout_config = {
                        height = 0.3,
                    },
                },
            },
            extensions = {
                project = {
                    theme = "dropdown",
                    hidden_files = true,
                    -- order_by = "asc",
                    base_dirs = {},
                    mappings = {},
                },
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case",the default case_mode is "smart_case"
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("project")
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("smart_history")
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("asynctasks")
        require("telescope").load_extension("noice")
    end,
}
