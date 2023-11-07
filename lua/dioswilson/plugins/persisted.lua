return {
    "olimorris/persisted.nvim",
    config = function()
        require("persisted").setup({
            autoload = true,
            should_autosave = function()
                --Do not save empty buffers
                if vim.bo.filetype == "" then
                    return false
                end
                return true
            end,
        })
        require("telescope").load_extension("persisted")
        require("dioswilson.keymap.persisted")

        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistedSavePre",
            callback = function()
                --Close neo tree before saving because it doesn't like opening it
                require("neo-tree.command").execute({ action = "close" })
            end,
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                if vim.fn.isdirectory(vim.fn.expand("%:p")) == 1 then
                    vim.cmd("SessionLoad")
                end
            end,
        })
    end,
}
