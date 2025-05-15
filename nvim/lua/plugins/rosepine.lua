return {
    "rose-pine/neovim",
    name = "rose-pine",
    init = function()
        vim.opt.background = "dark"
    end,
    opts = {
        styles = {
            bold = false,
            italic = true,
            transparency = false
        }
    }
}
