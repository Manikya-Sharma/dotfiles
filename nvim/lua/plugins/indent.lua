local opts = {
	static = {
		char = "┆",
	},
	scope = {
		char = "│",
		highlights = { "BlinkIndentScope" },
	},
}

require("blink.indent").setup(opts)
