return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "warm",
                highlights = {
                    ["Structure"] = { fg = "blue" },
                },
            })
            -- vim.cmd.colorscheme("onedark")
            vim.api.nvim_set_hl(0, "@type.qualifier.java", { link = "Keyword" })
        end,
    },
    {
        dir="~/nvimcolorscheme/customColor", --Local path, currently on development
        -- "AgustinOrdonez/customColor.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("customColor")

            -- vim.api.nvim_set_hl(0, "@lsp.type.parameter.java", { link = "Keyword" }) JUST FOR TESTING
        end,
    },

    {
        "doums/darcula",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("darcula")
        end,
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("nightfly")
        end,
    },
}
