return {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")

        vim.cmd({ cmd = "highlight", args = { "RainbowDelimiterYellow", "guifg=#E8BA36", "ctermfg=White" } })
        vim.cmd({ cmd = "highlight", args = { "RainbowDelimiterGreen", "guifg=#54A857", "ctermfg=White" } })
        vim.cmd({ cmd = "highlight", args = { "RainbowDelimiterLightBlue", "guifg=#359FF4", "ctermfg=White" } })
        vim.cmd({ cmd = "highlight", args = { "RainbowDelimiterViolet", "guifg=#6E7ED9", "ctermfg=White" } })
        vim.cmd({ cmd = "highlight", args = { "RainbowDelimiterTurquoise", "guifg=#179387", "ctermfg=White" } })

        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            highlight = {
                "RainbowDelimiterYellow",
                "RainbowDelimiterGreen",
                "RainbowDelimiterLightBlue",
                "RainbowDelimiterViolet",
                "RainbowDelimiterTurquoise",
                "RainbowDelimiterRed", --Change this maybe
                "RainbowDelimiterOrange",
                "RainbowDelimiterCyan",
            },
        }
    end,
}
