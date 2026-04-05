require("trouble").setup()
vim.keymap.set("n", "<C-T>", function()
	vim.cmd("Trouble diagnostics toggle focus=true")
end)
