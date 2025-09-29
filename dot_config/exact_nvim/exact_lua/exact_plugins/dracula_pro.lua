return {
    {
        name = "dracula_pro",
        dir = "~/.themes/dracula-pro/themes/v2/vim",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme dracula_pro]])
        end,
    },
}
