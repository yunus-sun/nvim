return {
    "rhysd/accelerated-jk",
    enabled = false, -- FIX: not good to use
    keys = {
        -- { "j", "<Plug>(accelerated_jk_gj)", "n", { noremap = true, silent = true } },
        -- { "k", "<Plug>(accelerated_jk_gk)", "n", { noremap = true, silent = true } },
        { "j", "<Plug>(accelerated_jk_gj_position)", "n", { noremap = true, silent = true } },
        { "k", "<Plug>(accelerated_jk_gk_position)", "n", { noremap = true, silent = true } },
    },
}
