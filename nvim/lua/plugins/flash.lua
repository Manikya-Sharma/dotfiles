local opts = {
	modes = {
		char = {
			enabled = false,
		},
	},
}

require("flash").setup(opts)
vim.keymap.set({ "n", "x", "o" }, "<leader>q", function()
	require("flash").jump()
end)
