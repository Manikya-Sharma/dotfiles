return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").load({
			on_palette = function() end,
			on_highlight = function() end,
			after_palette = function(palette)
				local U = require("nordic.utils")
				palette.bg_visual = U.blend(palette.orange.base, palette.bg, 0.15)
				local illuminateColors = U.blend(palette.gray0, palette.gray1, 0.4)
				vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = illuminateColors })
				vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = illuminateColors })
				vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = illuminateColors })
			end,
			bold_keywords = false,
			bright_border = true,
			swap_backgrounds = true,
		})
	end,
	-- enabled = false,
}
