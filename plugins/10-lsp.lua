return {
    --------------------------------------------------------------------------------------------
    --- LSP 垃圾回收器 
    {"zeioth/garbage-day.nvim", opts = {}}, {
        "henry-hsieh/riscv-asm-vim",
        event = "VeryLazy",
        opts = {},
        config = function() end
    },
    --------------------------------------------------------------------------------------------
    --- LSP 垃圾回收器 
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({"v", "n"}, "gf",
                           require("actions-preview").code_actions)
        end
    },
    --------------------------------------------------------------------------------------------
    --- lsp 垃圾回收器 
    {'kosayoda/nvim-lightbulb', config = true},

    --------------------------------------------------------------------------------------------
    --- lsp 垃圾回收器 
    {'gfanto/fzf-lsp.nvim', config = true},
    --------------------------------------------------------------------------------------------
    --- lsp 键入时显示函数签名。
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "verylazy",
    --     opts = {},
    --     config = function(_, opts) require'lsp_signature'.setup(opts) end
    -- },
    --------------------------------------------------------------------------------------------
    --- lsp 垃圾回收器 
    {
        {
            'rmagatti/goto-preview',
            config = function() require('goto-preview').setup {} end
        }
    }
}
