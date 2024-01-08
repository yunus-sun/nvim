local opts = {noremap = true, silent = true}

-- NOTE: Install:
-- 1. To install ueberzug, please use the douban source to pip
-- 2. bug fix: https://blog.csdn.net/barlinbento/article/details/111572023
-- 3. pip install jupyter
return{
    "dccsillag/magma-nvim",
    enabled = true,
    lazy = true,
    ft = {'python'},
    build = ':UpdateRemotePlugins', -- By manual?
    config = function()
        function MagmaInitPython()
            vim.cmd[[
            :MagmaInit python3
            :MagmaEvaluateArgument a=5
            ]]
        end
        -- function MagmaInitCSharp()
        --     vim.cmd[[
        --     :MagmaInit .net-csharp
        --     :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
        --     ]]
        -- end
        -- function MagmaInitFSharp()
        --     vim.cmd[[
        --     :MagmaInit .net-fsharp
        --     :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
        --     ]]
        -- end
        vim.cmd[[
        :command MagmaInitPython lua MagmaInitPython()
        " :command MagmaInitCSharp lua MagmaInitCSharp()
        " :command MagmaInitFSharp lua MagmaInitFSharp()
        ]]

        vim.api.nvim_set_var("magma_automatically_open_output", true)
        vim.api.nvim_set_var("magma_image_provider", "ueberzug")
        -- vim.api.nvim_set_var("magma_image_provider", "kitty")
    end,
    keys = function()
        vim.cmd[[
        nnoremap <expr><silent> <Leader>r  nvim_exec('MagmaEvaluateOperator', v:true)
        ]]
        vim.keymap.set("n", "<Leader>rr", "<cmd>MagmaEvaluateLine<CR>", { silent = true, })
        vim.keymap.set({"v"}, "<Leader>r", ":<C-u>MagmaEvaluateVisual<CR>", { silent = true, })
        vim.keymap.set("n", "<Leader>rc", "<cmd>MagmaReevaluateCell<CR>", { silent = true, })
        vim.keymap.set("n", "<Leader>rd", "<cmd>MagmaDelete<CR>", { silent = true, })
        vim.keymap.set("n", "<Leader>ro", "<cmd>MagmaShowOutput<CR>", { silent = true, })
        vim.keymap.set("n", "<Leader>rp", "<cmd>MagmaInitPython<CR>", { silent = true, })
    end
}
