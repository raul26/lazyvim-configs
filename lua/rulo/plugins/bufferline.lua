return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufReadPre",
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			numbers = "none",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
}
