local default_settings = {
  virtual_text = false,
  underline = true,
  signs = true,
}

-- Define symbols for diagnostic signs
vim.cmd('sign define LspDiagnosticsSignError text=  texthl=LspDiagnosticsSignError linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=  texthl=LspDiagnosticsSignInformation linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignHint text=  texthl=LspDiagnosticsSignHint linehl= numhl=')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    default_settings
)
