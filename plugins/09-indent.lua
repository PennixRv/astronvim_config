local excluded_filetypes = {
    "Trouble", "aerial", "alpha", "checkhealth", "dashboard", "fzf", "help",
    "lazy", "lspinfo", "man", "mason", "neo-tree", "notify", "null-ls-info",
    "starter", "toggleterm", "undotree"
}
local excluded_buftypes = {"nofile", "prompt", "quickfix", "terminal"}

return {
    --------------------------------------------------------------------------------------------
    --- 缩进跳转器
    {
        "arsham/indent-tools.nvim",
        dependencies = {"arsham/arshlib.nvim"},
        event = "User AstroFile",
        config = function() require("indent-tools").config {} end
    },

    --------------------------------------------------------------------------------------------
    --- 缩进显示器 
    {
        {
            "echasnovski/mini.indentscope",
            event = "User AstroFile",
            opts = {symbol = "│", options = {try_as_border = true}},
            init = function()
                vim.api.nvim_create_autocmd("FileType", {
                    desc = "Disable indentscope for certain filetypes",
                    pattern = excluded_filetypes,
                    callback = function(event)
                        vim.b[event.buf].miniindentscope_disable = true
                    end
                })
                vim.api.nvim_create_autocmd("BufWinEnter", {
                    desc = "Disable indentscope for certain buftypes",
                    callback = function(event)
                        if vim.tbl_contains(excluded_buftypes,
                                            vim.bo[event.buf].buftype) then
                            vim.b[event.buf].miniindentscope_disable = true
                        end
                    end
                })
                vim.api.nvim_create_autocmd("TermOpen", {
                    desc = "Disable indentscope for terminals",
                    callback = function(event)
                        vim.b[event.buf].miniindentscope_disable = true
                    end
                })
            end
        },
        {
            "catppuccin/nvim",
            optional = true,
            opts = {integrations = {mini = true}}
        }
    }
}
