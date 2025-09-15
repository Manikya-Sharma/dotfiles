return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
    opts = {
        flavour = "latte",
        auto_integrations = true
    }
}
