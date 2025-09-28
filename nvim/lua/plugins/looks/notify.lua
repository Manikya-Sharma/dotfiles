return {
	"rcarriga/nvim-notify",
	lazy = false,
	init = function()
		vim.notify = require("notify")
	end,
	opts = {
		render = "wrapped-compact",
		timeout = 2000,
	},
	enabled = Fancy,
}
