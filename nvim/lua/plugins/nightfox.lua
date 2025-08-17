return {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd('colorscheme carbonfox')
    end,
    opts = {
        options = {
            dim_inactive = true,
            styles = {
                comments = "italic",
                keywords = "bold",
                types = "italic,bold"
            }
        },
    }
}
