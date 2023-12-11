--Maybe shouldn't have it here?
-- TODO: FIGURE THIS OUT
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_assume_mapped = true
return {
    "github/copilot.vim",
}
