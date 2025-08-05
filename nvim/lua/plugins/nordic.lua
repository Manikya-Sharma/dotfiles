return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()
        require('nordic').setup({
            bold_keywords = true,
            transparent = { bg = true },
            telescope = { style = 'classic' },
        })
    end
}
