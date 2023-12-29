local data = require("rulo.core.attach")
return {
	"mrcjkb/rustaceanvim",
	version = "^3", -- Recommended
	ft = { "rust" },
	opts = {
		server = {
			on_attach = data.on_attach,
			settings = {
				-- rust-analyzer language server configuration
				["rust-analyzer"] = {
					cmd = { "rustup", "run", "stable", "rust-analyzer" },
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
						runBuildScripts = true,
					},
					-- Add clippy lints for Rust.
					checkOnSave = {
						allFeatures = true,
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
					procMacro = {
						enable = true,
						ignored = {
							["async-trait"] = { "async_trait" },
							["napi-derive"] = { "napi" },
							["async-recursion"] = { "async_recursion" },
						},
					},
				},
			},
		},
	},
	config = function(_, opts)
		vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
	end,
}
