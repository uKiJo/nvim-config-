local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
  end,
  capabilities = capabilities,
}
