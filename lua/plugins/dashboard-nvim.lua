-- FIX:
-- Bug: https://github.com/glepnir/dashboard-nvim/issues/155
-- delete the line 178,181,182 of `C:\Users\Yunus\AppData\Local\nvim-data\lazy\dashboard-nvim\lua\dashboard\theme\hyper.lua`
-- TODO:
-- 1. how to show the recent project?
-- telescope-project.nvim can create and use the project.
-- 2. file path is so long that cannot display ina proper width.
return {
    'glepnir/dashboard-nvim',
    -- enabled = false, -- FIX: cannot fix the bug!
    enabled = true,
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}, {'nvim-telescope/telescope.nvim'}},
    opts = {
        theme = 'hyper',
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
                {
                    desc = ' Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    desc = ' Apps',
                    group = 'DiagnosticHint',
                    action = 'Telescope app',
                    key = 'a',
                },
                {
                    desc = ' dotfiles',
                    group = 'Number',
                    action = 'Telescope dotfiles',
                    key = 'd',
                },
            },
            footer = {' 🚀 We Choose to Go to the Moon! 🚀 '},
        },
    },    --  config used for theme
    hide = {
        statusline,    -- hide statusline default is true
        tabline,       -- hide the tabline
        winbar,        -- hide winbar
    },
    preview = {
        command,       -- preview command
        file_path,    -- preview file path
        file_height,   -- preview file height
        file_width,    -- preview file width
    },
}
