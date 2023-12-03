return {
    --- 完全禁用astronvim自带的heirline插件
    {
        "rebelot/heirline.nvim",
        enabled = false,
        optional = true,
        tabline = nil,
        winbar = nil,
        statusline = nil
    }, ---
    --- 使用bufferline来管理tab
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left"
                    }
                },
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon'
                }
            }
        },
        keys = {
            {"<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>"},
            {"<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>"},
            {"<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>"},
            {"<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>"},
            {"<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>"},
            {"<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>"},
            {"<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>"},
            {"<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>"},
            {"<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>"}
        }
    }
}
