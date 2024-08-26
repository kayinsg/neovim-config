local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("lsp.main.IDEPackageManager")
require("lsp.settings.LSPResponseProcessors").setup()
require("lsp.main.formatter")
require("lsp.main.debugger")
