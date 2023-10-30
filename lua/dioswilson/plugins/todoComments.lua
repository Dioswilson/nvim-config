return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = {
            keyword = "fg",
        },
        keywords = {
            TODO = { alt = { "Todo" } },
            FIX = { alt = { "Fix" } },
            HACK = { alt = { "Hack" } },
            WARN = { alt = { "Warn" } },
            PERF = { alt = { "Perf" } },
            NOTE = { alt = { "Note" } },
            TEST = { alt = { "Test" } },
        },
    },
}
