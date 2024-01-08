-- TODO: don't know how to use it, config is from https://www.bilibili.com/read/cv22495061/.
return{
    "kevinhwang91/nvim-ufo",
    enabled = true,
    lazy = false,
    -- event = "BufEnter",
    -- cmd = { "UfoDisable", "UfoEnable" },
    dependencies = {
        "kevinhwang91/promise-async",
    },
    init = function ()
        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = -1
        vim.o.foldenable = true

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

        -- vim.cmd([[hi default UfoFoldedFg guifg=Normal.foreground]])
        -- vim.cmd([[hi default UfoFoldedBg guibg=Folded.background]])
        vim.cmd([[hi default link UfoPreviewSbar PmenuSbar]])
        vim.cmd([[hi default link UfoPreviewThumb PmenuThumb]])
        vim.cmd([[hi default link UfoPreviewWinBar UfoFoldedBg]])
        vim.cmd([[hi default link UfoPreviewCursorLine Visual]])
        vim.cmd([[hi default link UfoFoldedEllipsis Comment]])
        vim.cmd([[hi default link UfoCursorFoldedLine CursorLine]])

    end,
    config = function()
        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, {chunkText, hlGroup})
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, {suffix, 'MoreMsg'})
            return newVirtText
        end

        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
            -- global handler
            -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
            -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
            fold_virt_text_handler = handler,
        })

        -- buffer scope handler
        -- will override global handler if it is existed
        -- local bufnr = vim.api.nvim_get_current_buf()
        -- require('ufo').setFoldVirtTextHandler(bufnr, handler)
    end,
}
