return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Key mappings (currently commented out)
				-- opts.desc = "Show LSP references"
				-- keymap.set("n", "gR", vim.lsp.buf.references, opts)

				-- opts.desc = "Go to declaration"
				-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				-- opts.desc = "Show LSP definitions"
				-- keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				-- opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

				-- opts.desc = "Show LSP type definitions"
				-- keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

				-- opts.desc = "See available code actions"
				-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				-- opts.desc = "Smart rename"
				-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)

				-- opts.desc = "Show line diagnostics"
				-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				-- opts.desc = "Go to previous diagnostic"
				-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				-- opts.desc = "Go to next diagnostic"
				-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				-- opts.desc = "Show documentation for what is under cursor"
				-- keymap.set("n", "K", vim.lsp.buf.hover, opts)

				-- opts.desc = "Restart LSP"
				-- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- Diagnostic symbols in sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup({
			function(server_name)
				lspconfig[server_name].setup({})
			end,
			["pyright"] = function()
				lspconfig["pyright"].setup({
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
			["bashls"] = function()
				lspconfig["bashls"].setup({
					filetypes = { "sh", "bash" },
				})
			end,
		})
	end,
}
