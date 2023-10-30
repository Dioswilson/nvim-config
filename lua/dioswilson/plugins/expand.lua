return {
    "Sam-programs/expand.nvim",
    dependencies = {
        "Sam-Programs/indent.nvim",
    },
    config = function()
        require("expand").setup({
            filetypes = { --TODO: Continue customizing regex and pairs, it is super powerful
                lua = {
                    -- if we are expanding on an unnamed function might aswell add the pairs
                    { "function\\s*$", { "()", "end" } },
                    { "function", { "", "end" } },
                    { "if", { " then", "end" } },
                    -- regex for a lua variable
                    { "^\\s*\\w\\+\\s*\\w*\\s*=\\s*$", { "{", "}" } },
                    { "", { " do", "end" } }, --This is fallback
                },
                sh = {
                    { "elif", { " ;then", "" } },
                    { "if", { " ;then", "if" } },
                    { "case", { "", "esac" } },
                    { "while", { " do", "done" } },
                    { "for", { " do", "done" } },
                    { "", { "", "" }, { do_nothing = true } }, --This is fallback
                },
                bash = {
                    { "elif", { " ;then", "" } },
                    { "if", { " ;then", "if" } },
                    { "case", { "", "esac" } },
                    { "while", { " do", "done" } },
                    { "for", { " do", "done" } },
                    { "", { "", "" }, { do_nothing = true } }, --This is fallback
                },
                zsh = {
                    { "elif", { " then", "" } },
                    { "if", { " then", "if" } },
                    { "case", { "", "esac" } },
                    { "while", { " do", "done" } },
                    { "for", { " do", "done" } },
                    { "", { "", "" }, { do_nothing = true } }, --This is fallback
                },
                java = {
                    { "\\( if\\|for\\|while \\)\\s*(.*)\\s*$", { "{", "}" } },
                    { ".*(.*)\\s*$", { ";", "" } }, --For function call
                    { ".*=.*$", { ";", "" }, { endpair_new_line = false } },
                    { "", { "", "" }, { do_nothing = true } }, --This is fallback
                },
                c = {
                    { "\\( if\\|for\\|while \\)\\s*(.*)\\s*$", { "{", "}" } },
                    { ".*(.*)\\s*$", { ";", "" } }, --For function call
                    { "struct .*$", { "{", "};" } },
                    { ".*=.*$", { ";", "" }, { endpair_new_line = false } },
                    { "", { "", "" }, { do_nothing = true } }, --This is fallback
                },
                cpp = {
                    { "\\(if\\|for\\|while\\)\\s*(.*)\\s*$", { "{", "}" } },
                    { ".*(.*)\\s*$", { ";", "" } }, --For function call
                    { "struct .*$", { "{", "};" } },
                    { ".*=.*$", { ";", "" }, { endpair_new_line = false } },
                    { "", { "", "" }, { endpair_new_line = false } }, --This is fallback
                },
            },
            hotkey = "<C-Enter>",
        })
    end,
}