local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "rulo.plugins" },
	{ import = "rulo.plugins.lsp" },
	-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
	-- { import = "lazyvim.plugins.extras.test.core" },
}, {
	install = {
		colorscheme = { "light" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
