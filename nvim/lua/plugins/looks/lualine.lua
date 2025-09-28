return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local has_arrow, statusline = pcall(require, "arrow.statusline")
		local function arrow_status()
			if not has_arrow then
				vim.notify("Arrow not found", "error", { title = "Config" })
				return {}
			end
			return statusline.text_for_statusline_with_icons()
		end
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_lsp" },
			symbols = { error = " ", warn = " ", info = " " },
		}
		local lsp_status = {
			"lsp_status",
			icon = "",
			symbols = {
				done = "",
			},
		}
		local diff = {
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
			separator = { left = "" },
		}
		local aerial = {
			"aerial",
			depth = -3,
			dense_sep = ".",
			dense = true,
			colored = true,
		}
		local winbar = {
			lualine_a = {},
			lualine_b = { "filename" },
			-- lsp_status will be handled by fidget
			lualine_c = Fancy and {} or { lsp_status },
			lualine_x = { aerial },
			lualine_y = {},
			lualine_z = {},
		}
		local inactive_winbar = {
			lualine_a = {},
			lualine_b = { "filename" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		}
		require("lualine").setup({
			theme = "auto",
			options = {
				section_separators = { left = " ", right = " " },
				component_separators = { left = " ", right = " " },
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = {},
				lualine_c = { { "buffers", symbols = { alternate_file = "" } } },
				lualine_x = { lsp_status, arrow_status, diff, diagnostics },
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { arrow_status, diff },
				lualine_y = {},
				lualine_z = {},
			},
			winbar = winbar,
			inactive_winbar = inactive_winbar,
			extensions = {},
		})
		vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
	end,
}
