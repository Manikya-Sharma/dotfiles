return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                local builtin = require("statuscol.builtin")
                require("statuscol").setup({
                    relculright = true,
                    segments = {
                        { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                        { text = { "%s" },                  click = "v:lua.ScSa" },
                        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                    },
                })
            end,
        },
    },
    event = "BufReadPost",
    opts = {
        provider_selector = function()
            return { "treesitter", "indent" }
        end,
    },
    init = function()
        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.keymap.set("n", "zR", function()
            require("ufo").openAllFolds()
        end)
        vim.keymap.set("n", "zM", function()
            require("ufo").closeAllFolds()
        end)
        vim.opt.fillchars = {
            horiz = '━',
            horizup = '┻',
            horizdown = '┳',
            vert = '┃',
            vertleft = '┫',
            vertright = '┣',
            verthoriz = '╋',
            eob = "~",
            fold = " ",
            foldopen = "",
            foldsep = " ",
            foldclose = ""
        }
    end,
}
