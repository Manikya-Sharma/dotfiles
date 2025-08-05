return {
    'b0o/incline.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('incline').setup({
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                local modified = vim.bo[props.buf].modified
                return {
                    { filename, gui = modified and 'bold,italic' or 'bold', guifg = modified and '#aaaaaa' or '#777777' },
                }
            end
        })
    end,
    event = 'VeryLazy',
}
