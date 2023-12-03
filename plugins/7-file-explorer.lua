return {

    --------------------------------------------------------------------------------------------
    --- 一个类似 vim-vinegar 的文件浏览器，可让您像普通的 Neovim 缓冲区一样编辑文件系统。
    {
        "stevearc/oil.nvim",
        opts = {},
        enabled = true,
        cmd = "Oil",
        keys = {
            {
                "<leader>O",
                function() require("oil").open() end,
                desc = "Open folder in Oil"
            }
        }
    }
}
