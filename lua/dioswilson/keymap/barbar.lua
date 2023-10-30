local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { desc = desc })
end

--NOTE: Maybe change keymaps to use leader

-- Move to previous/next
map("<A-,>", "<Cmd>BufferPrevious<CR>", "Go to previous tab")
map("<A-.>", "<Cmd>BufferNext<CR>", "Go to next tab")
-- Re-order to previous/next
map("<A-<>", "<Cmd>BufferMovePrevious<CR>", "Move buffer previous")
map("<A->>", "<Cmd>BufferMoveNext<CR>", "Move buffer next")
-- Goto buffer in position...
map("<A-1>", "<Cmd>BufferGoto 1<CR>", "Go to tab 1")
map("<A-2>", "<Cmd>BufferGoto 2<CR>", "Go to tab 2")
map("<A-3>", "<Cmd>BufferGoto 3<CR>", "Go to tab 3")
map("<A-4>", "<Cmd>BufferGoto 4<CR>", "Go to tab 4")
map("<A-5>", "<Cmd>BufferGoto 5<CR>", "Go to tab 5")
map("<A-6>", "<Cmd>BufferGoto 6<CR>", "Go to tab 6")
map("<A-7>", "<Cmd>BufferGoto 7<CR>", "Go to tab 7")
map("<A-8>", "<Cmd>BufferGoto 8<CR>", "Go to tab 8")
map("<A-9>", "<Cmd>BufferGoto 9<CR>", "Go to tab 9")
map("<A-0>", "<Cmd>BufferLast<CR>", "Go to last tab")
-- Pin/unpin buffer
map("<A-p>", "<Cmd>BufferPin<CR>", "Pin tab")
-- Close buffer
map("<A-c>", "<Cmd>BufferClose<CR>", "Close tab")
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("<C-p>", "<Cmd>BufferPick<CR>", "Pick tab mode")
-- Sort automatically by...
map("<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", "Reorder tabs by BufferNumber")
map("<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", "Reorder tabs by Directory")
map("<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", "Reorder tabs by Language")
map("<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", "Reorder tabs by WindowNumber")

map("<leader><Tab>", "<C-^>", "Alternate tab")
