return function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    local builtin = require("telescope.builtin")

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    -- nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("<leader>gr", builtin.lsp_references, "[G]oto [R]eferences")
    nmap("<leader>gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- See `:help K` for why this keymap
    -- nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    -- nmap("K", ":Lspsaga hover_doc<CR>", "Hover Documentation")
    nmap("<leader>K", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- nmap("<leader>do", vim.diagnostic.open_float({ bufnr = bufnr }), "[D]iagnostic [O]pen")
    nmap("<leader>do", ":Lspsaga show_cursor_diagnostics<CR>", "[D]iagnostic [O]pen")
    nmap("<leader>pd", ":Lspsaga peek_definition<CR>", "[P]eek [D]efinition")
    nmap("<leader>hd", ":Lspsaga hover_doc<CR>", "[H]over [D]oc")
    nmap("<leader>ot", ":Lspsaga outline", "[O]utline [T]oggle")
    nmap("<leader>gd", "::Lspsaga goto_definition<CR>", "[G]oto [D]efinition") --Note: maybe change to <C-b>
end
