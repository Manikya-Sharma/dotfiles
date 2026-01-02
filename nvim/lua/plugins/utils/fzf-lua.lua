return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		winopts = {
			fullscreen = true,
		},
		keymap = {
			fzf = {
				["ctrl-q"] = "select-all+accept",
			},
			builtin = {
				["<C-E>"] = "preview-down",
				["<C-Y>"] = "preview-up",
			},
		},
	},
}
