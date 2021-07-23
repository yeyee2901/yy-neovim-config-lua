vim.g.show_lsp_diagnostics = true

local default_settings = {
        virtual_text = false,
        underline = true,
        signs = true,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    default_settings
)
