return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
		"davidmh/cspell.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")
		local cspell = require("cspell")

		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint", -- js linter
			},
		})

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			-- setup formatters & linters
			sources = {
				--  to disable file types use
				cspell.diagnostics,
				cspell.code_actions,
				formatting.prettier,
				null_ls.builtins.diagnostics.semgrep,
				diagnostics.semgrep.with({
					args = { "-q", "--json", "$FILENAME" },
					filetypes = {
						"typescript",
						"typescriptreact",
						"go",
					},
					method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				}),
				formatting.gofmt,
				formatting.goimports,
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.impl,
				formatting.stylua, -- lua formatter
				-- require("none-ls.code_actions.eslint"),
				require("none-ls.diagnostics.eslint").with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
					end,
				}),
			},
		})
	end,
}
