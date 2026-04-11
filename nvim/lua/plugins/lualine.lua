-- ref: https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
local lualine = require("lualine")

--Color table for highlights -> Kanagawa
local colors = {
	bg = "#16161D",
	fg = "#C8C093",
	yellow = "#FF9E3B",
	cyan = "#7E9CD8",
	darkblue = "#223249",
	green = "#76946A",
	orange = "#FF5D62",
	violet = "#957FB8",
	magenta = "#938AA9",
	blue = "#7AA89F",
	red = "#E82424",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()], gui = "bold" }
	end,
	padding = { left = 0, right = 1 },
})

ins_left({
	"branch",
	icon = "",
	padding = { right = 1 },
	color = { fg = "#ffffff", gui = "bold" },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
})

ins_right({
	"diagnostics",
	sources = { "nvim_lsp" },
	symbols = { error = " ", warn = " ", info = " " },
})

ins_right({
	"lsp_status",
	icon = "",
	symbols = {
		done = "",
	},
})

local has_arrow, statusline = pcall(require, "arrow.statusline")
local function arrow_status()
	if not has_arrow then
		vim.notify("Arrow not found", vim.log.levels.ERROR, { title = "Config" })
		return {}
	end
	return statusline.text_for_statusline_with_icons()
end

ins_right({ arrow_status })

ins_right({ "location" })

ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_right({
	function()
		return "▊"
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()], gui = "bold" }
	end,
	padding = { left = 1 },
})

lualine.setup(config)
