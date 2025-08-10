return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()
        require('nordic').setup({
            on_palette = function(palette)
                local old_gray = palette.gray0
                palette.gray0 = palette.black0
                palette.black0 = old_gray
            end,
            bold_keywords = true,
            bright_border = true,
        })
    end
}
