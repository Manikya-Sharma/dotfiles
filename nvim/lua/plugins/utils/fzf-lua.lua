return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		winopts = {
			fullscreen = true,
		},
		keymap = {
			builtin = {
				["<C-E>"] = "preview-down",
				["<C-Y>"] = "preview-up",
			},
		},
	},
}
