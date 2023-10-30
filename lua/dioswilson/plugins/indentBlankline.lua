return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  opts = {
  },
  config = function()
    require("ibl").setup({
      indent = {
        char = "┊",
        -- highlight = { "Function", "Label" },
        smart_indent_cap = true,
        priority = 6,
      }
    })
  end,
}
