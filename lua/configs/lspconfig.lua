-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require "lspconfig"
-- EXAMPLE
local servers = { "html", "cssls", "rust_analyzer", "yamlls", "pylsp", "bashls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
