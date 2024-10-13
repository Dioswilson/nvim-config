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

		
        -- Load session on startup with arguments (By https://github.com/neandrake)
        local persisted = require("persisted")
        vim.api.nvim_create_autocmd("VimEnter", {
            nested = true,
            callback = function()
                if vim.g.started_with_stdin then
                    return
                end

                local forceload = false
                if vim.fn.argc() == 0 then
                    forceload = true
                elseif vim.fn.argc() == 1 then
                    local dir = vim.fn.expand(vim.fn.argv(0))
                    if dir == "." then
                        dir = vim.fn.getcwd()
                    end

                    if vim.fn.isdirectory(dir) ~= 0 then
                        forceload = true
                    end
                end

                persisted.autoload({ force = forceload })
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistedSavePre",
            callback = function()
                --Close neo tree before saving because it doesn't like opening it
                require("neo-tree.command").execute({ action = "close" })
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistedLoadPost",
            callback = function()
                --Attempts to solve neotree being opened when opening a directory
                if require("neo-tree.setup.netrw").get_hijack_netrw_behavior() ~= "disabled" then
                    require("neo-tree.command").execute({ action = "close"})
                end
            end,
        })

    end,
}
