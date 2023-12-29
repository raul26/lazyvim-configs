return {
	"Saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	opts = {
		src = {
			cmp = { enabled = true },
		},
	},
	config = function()
		local crates = require("crates")
		crates.setup({
			null_ls = {
				enabled = true,
			},
			on_attach = function(bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				local keymap = vim.keymap -- for conciseness
				keymap.set("n", "<leader>D", function()
					crates.open_documentation()
				end, opts)

				keymap.set("n", "<leader>R", function()
					crates.open_repository()
				end, opts)

				keymap.set("n", "<leader>ct", crates.toggle, opts)
				keymap.set("n", "<leader>U", crates.upgrade_crate, opts)
				keymap.set("v", "<leader>U", crates.upgrade_crates, opts)
				keymap.set("n", "<leader>v", function()
					crates.show_versions_popup()
					crates.focus_popup()
				end, opts)
				keymap.set("n", "<leader>f", function()
					crates.show_features_popup()
					crates.focus_popup()
				end, opts)

				keymap.set("n", "K", function()
					if vim.fn.expand("%:t") == "Cargo.toml" and crates.popup_available() then
						crates.show_popup()
					else
						vim.lsp.buf.hover()
					end
				end, opts)
			end,
		})
	end,
}
