return {
    -- dir="~/CodeStuff/nvimPlugins/expand.nvim",
    "Sam-programs/expand.nvim",
    branch = "testing",
    dependencies = {
        "Sam-Programs/indent.nvim",
    },
    config = function()
        local notCurlyEnding = "\\(.*{\\)\\@!"
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
                    {
                        "\\(if\\|for\\|while\\)\\s*(.*)\\s*" .. notCurlyEnding,
                        { "{", "}" },
                        { wrap_pair_between_match = true },
                    },
                    { ".*(.*)\\s*$", { ";", "" } }, --For function call (Maybe not have  this )
                    { ".*=.*$", { ";", "" }, { endpair_new_line = false } },
                    { "", { "", "" }, { endpair_new_line = false } }, --This is fallback
                },
                c = {
                    {
                        "\\(if\\|for\\|while\\)\\s*(.*)\\s*" .. notCurlyEnding,
                        { "{", "}" },
                        { wrap_pair_between_match = true },
                    },
                    { ".*(.*)\\s*$", { ";", "" } }, --For function call (Maybe not have  this )
                    { "typedef struct \\w\\{0,1}" .. notCurlyEnding, { "{", "};" } },
                    { "struct \\w" .. notCurlyEnding, { "{", "};" } },
                    { ".*=.*$", { ";", "" }, { endpair_new_line = false } },
                    { "", { "", "" }, { endpair_new_line = false } }, --This is fallback
                },
                cpp = { --Todo: include function creation with {}
                    {
                        "\\(if\\|for\\|while\\)\\s*(.*)\\s*" .. notCurlyEnding,
                        { "{", "}" },
                        { wrap_pair_between_match = true },
                    },
                    { ".*(.*)\\s*$", { ";", "" } }, --For function call (Maybe not have  this )
                    { "class " .. notCurlyEnding, { "{", "};" } },
                    { "typedef struct \\w\\{0,1}" .. notCurlyEnding, { "{", "};" } },
                    { "struct \\w" .. notCurlyEnding, { "{", "};" } },
                    { ".*=.*$", { ";", "" }, { endpair_new_line = false } },
                    { "", { "", "" }, { endpair_new_line = false } }, --This is fallback
                },
            },
            hotkey = "<C-Enter>",
            wrap_hotkey = "<C-Enter>",
        })
    end,
}
