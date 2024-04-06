local M = {}

function M.on_attach(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap -- for conciseness

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
	keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "td", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	if client.name == "rust-analyzer" then
		keymap.set("n", "<leader>ca", ":RustLsp codeAction<CR>", { buffer = bufnr })
		keymap.set("n", "<leader>dr", ":RustLsp debuggables<CR>", { buffer = bufnr })
		keymap.set("n", "<leader>run", ":RustLsp runnables<CR>", { buffer = bufnr })
		keymap.set("n", "<leader>em", ":RustLsp expandMacro<CR>", { buffer = bufnr })
		keymap.set("n", "<leader>ee", ":RustLsp explainError<CR>", { buffer = bufnr })
		keymap.set("n", "<leader>oc", ":RustLsp openCargo<CR>", { buffer = bufnr })
		keymap.set("n", "<leader>pm", ":RustLsp parentModule<CR>", { buffer = bufnr })
		keymap.set("n", "K", ":RustLsp hover actions<CR>", { buffer = bufnr })
	else
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
		keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>") --imports
	end

	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "html" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "typescript" then
		client.server_capabilities.document_formatting = false
	end
	-- set keybinds

	-- opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

	-- opts.desc = "Show LSP implementations"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	-- opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

	-- opts.desc = "Smart rename"
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

	-- opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
end
return M
