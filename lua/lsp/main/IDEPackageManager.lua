local servers = {
	"pyright",
	-- Uncomment these as needed
	-- "lua_ls",
	-- "cssls",
	-- "html",
	-- "tsserver",
	-- "bashls",
	-- "jsonls",
	-- "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require("lspconfig")

local opts = {
	on_attach = require("lsp.settings.LSPResponseProcessors").on_attach,
	capabilities = require("lsp.settings.LSPResponseProcessors").capabilities,
}

for _, server in pairs(servers) do
	local server_opts = vim.deepcopy(opts)

	local has_custom_opts, custom_opts = pcall(require, "lsp.LanguageServerProtocolSettings." .. server)
	if has_custom_opts then
		server_opts = vim.tbl_deep_extend("force", server_opts, custom_opts)
	end

	lspconfig[server].setup(server_opts)
end
