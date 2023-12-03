local prefix = "<leader>a"
local maps = {n = {}}
local icon = vim.g.icons_enabled and "󰷉 " or ""
maps.n[prefix] = {desc = icon .. "Annotation"}
require("astronvim.utils").set_mappings(maps)
return {
    --------------------------------------------------------------------------------------------
    --- 使用方框和线条澄清和美化您的评论。 
    {"LudoPinelli/comment-box.nvim", event = "User AstroFile", opts = {}},

    --------------------------------------------------------------------------------------------
    --- 一个更好的注释生成器。支持多种语言和注解约定。
    {
        "danymat/neogen",
        cmd = "Neogen",
        opts = {
            snippet_engine = "luasnip",
            languages = {
                lua = {template = {annotation_convention = "ldoc"}},
                typescript = {template = {annotation_convention = "tsdoc"}},
                typescriptreact = {template = {annotation_convention = "tsdoc"}}
            }
        },
        keys = {
            {
                prefix .. "<cr>",
                function()
                    require("neogen").generate {type = "current"}
                end,
                desc = "Current"
            }, {
                prefix .. "c",
                function()
                    require("neogen").generate {type = "class"}
                end,
                desc = "Class"
            }, {
                prefix .. "f",
                function()
                    require("neogen").generate {type = "func"}
                end,
                desc = "Function"
            }, {
                prefix .. "t",
                function()
                    require("neogen").generate {type = "type"}
                end,
                desc = "Type"
            }, {
                prefix .. "F",
                function()
                    require("neogen").generate {type = "file"}
                end,
                desc = "File"
            }
        }
    },

    --------------------------------------------------------------------------------------------
    --- 这是一个简单的插件，有助于自动结束某些结构。在 Ruby 中，这意味着在 if、do、def 等之后添加 end。这甚至适用于嵌套在其他语言中的语言，例如带有 Lua 代码块的 Markdown！

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {"RRethy/nvim-treesitter-endwise"},
        opts = {endwise = {enable = true}}
    },

    --------------------------------------------------------------------------------------------
    --- 带有 Tree-sitter 的 Neovim 的彩虹分隔符
    {
        {
            "HiPhish/rainbow-delimiters.nvim",
            dependencies = "nvim-treesitter/nvim-treesitter",
            event = "User AstroFile",
            config = function(_, opts)
                require "rainbow-delimiters.setup"(opts)
            end
        }
    },

    --------------------------------------------------------------------------------------------
    --- 基于 Martin Fowler 的《重构》一书的重构库
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"
        },
        cmd = {"Refactor"},
        opts = {},
        keys = {
            {
                "<leader>re",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                {silent = true, expr = false},
                mode = {"v", "x"},
                desc = "Extract Function"
            }, {
                "<leader>rf",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
                {silent = true, expr = false},
                mode = {"v", "x"},
                desc = "Extract Function To File"
            }, {
                "<leader>rv",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
                {silent = true, expr = false},
                mode = {"v", "x"},
                desc = "Extract Variable"
            }, {
                "<leader>ri",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                {silent = true, expr = false},
                mode = {"n", "v", "x"},
                desc = "Inline Variable"
            }, {
                "<leader>rb",
                function()
                    require("refactoring").refactor "Extract Block"
                end,
                {silent = true, expr = false},
                mode = {"n"},
                desc = "Extract Block"
            }, {
                "<leader>rbf",
                function()
                    require("refactoring").refactor "Extract Block To File"
                end,
                {silent = true, expr = false},
                mode = {"n"},
                desc = "Extract Block To File"
            }, {
                "<leader>rr",
                function()
                    require("refactoring").select_refactor()
                end,
                {silent = true, expr = false},
                desc = "Select Refactor"
            }, {
                "<leader>rp",
                function()
                    require("refactoring").debug.printf {below = false}
                end,
                mode = {"n"},
                desc = "Debug: Print Function"
            }, {
                "<leader>rd",
                function()
                    require("refactoring").debug.print_var {
                        normal = true,
                        below = false
                    }
                end,
                mode = {"n"},
                desc = "Debug: Print Variable"
            }, {
                "<leader>rd",
                function()
                    require("refactoring").debug.print_var {below = false}
                end,
                mode = {"v"},
                desc = "Debug: Print Variable"
            }, {
                "<leader>rc",
                function()
                    require("refactoring").debug.cleanup {}
                end,
                mode = {"n"},
                desc = "Debug: Clean Up"
            }
        }
    },

    --------------------------------------------------------------------------------------------
    --- 用于查看和搜索撤消树🌴的望远镜扩展
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {"debugloop/telescope-undo.nvim"},
        keys = {{"<leader>fu", "<cmd>Telescope undo<CR>", desc = "Find undos"}},
        opts = function() require("telescope").load_extension "undo" end
    },

    --------------------------------------------------------------------------------------------
    --- 用于在 Neovim 中转换文本大小写的多合一插件
    {"johmsalas/text-case.nvim", event = "User AstroFile", opts = {}},

    --------------------------------------------------------------------------------------------
    --- 突出显示、列出和搜索项目中的待办事项注释
    {"folke/todo-comments.nvim", opts = {}, event = "User AstroFile"},

    --------------------------------------------------------------------------------------------
    --- Neovim 插件，用于拆分/连接代码块
    {
        "Wansmer/treesj",
        keys = {
            {"<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join"}
        },
        cmd = {"TSJToggle", "TSJSplit", "TSJJoin"},
        opts = {use_default_keymaps = false}
    },

    --------------------------------------------------------------------------------------------
    --- Ultimate-autopair 插件旨在始终按您的预期工作，同时使其相对容易配置。它具有其他自动配对插件所缺乏的许多功能：如多行支持、字符串/转义过滤等。它经过全面测试，并具有良好的文档。
    {
        {"windwp/nvim-autopairs", enabled = false}, {
            "altermo/ultimate-autopair.nvim",
            event = "InsertEnter",
            branch = "v0.6", -- recommended as each new version will have breaking changes
            opts = {
                -- disable autopair in the command line: https://github.com/altermo/ultimate-autopair.nvim/issues/8
                cmap = false,
                extensions = {
                    cond = {
                        -- disable in comments
                        -- https://github.com/altermo/ultimate-autopair.nvim/blob/6fd0d6aa976a97dd6f1bed4d46be1b437613a52f/Q%26A.md?plain=1#L26
                        cond = {
                            function(fn)
                                return not fn.in_node "comment"
                            end
                        }
                    },
                    -- get fly mode working on strings:
                    -- https://github.com/altermo/ultimate-autopair.nvim/issues/33
                    fly = {nofilter = true}
                },
                config_internal_pairs = {
                    {'"', '"', fly = true}, {"'", "'", fly = true}
                }
            },
            keys = {
                {
                    "<leader>ua",
                    function()
                        local notify = require("astronvim.utils").notify
                        local function bool2str(bool)
                            return bool and "on" or "off"
                        end
                        local ok, ultimate_autopair = pcall(require,
                                                            "ultimate-autopair")
                        if ok then
                            ultimate_autopair.toggle()
                            vim.g.ultimate_autopair_enabled = require(
                                                                  "ultimate-autopair.core").disable
                            notify(string.format("ultimate-autopair %s",
                                                 bool2str(
                                                     not vim.g
                                                         .ultimate_autopair_enabled)))
                        else
                            notify "ultimate-autopair not available"
                        end
                    end,
                    desc = "Toggle ultimate-autopair"
                }
            }
        }
    },

    --------------------------------------------------------------------------------------------
    --- 用于上下移动行和选择的插件
    {"matze/vim-move", event = "BufEnter"},

    --------------------------------------------------------------------------------------------
    --- 改进了 Neovim 的 Yank 和 Put 功能
    {
        "gbprod/yanky.nvim",
        event = "UIEnter",
        dependencies = {
            {"kkharji/sqlite.lua", enabled = not jit.os:find "Windows"}
        },
        opts = function()
            local mapping = require "yanky.telescope.mapping"
            local mappings = mapping.get_defaults()
            mappings.i["<c-p>"] = nil
            return {
                highlight = {timer = 200},
                ring = {storage = jit.os:find "Windows" and "shada" or "sqlite"},
                picker = {
                    telescope = {
                        use_default_mappings = false,
                        mappings = mappings
                    }
                }
            }
        end,
        keys = {
            {
                "<leader>p",
                function()
                    require("telescope").extensions.yank_history.yank_history {}
                end,
                desc = "Open Yank History"
            },
            {"y", "<Plug>(YankyYank)", mode = {"n", "x"}, desc = "Yank text"},
            {
                "p",
                "<Plug>(YankyPutAfter)",
                mode = {"n", "x"},
                desc = "Put yanked text after cursor"
            }, {
                "P",
                "<Plug>(YankyPutBefore)",
                mode = {"n", "x"},
                desc = "Put yanked text before cursor"
            }, {
                "gp",
                "<Plug>(YankyGPutAfter)",
                mode = {"n", "x"},
                desc = "Put yanked text after selection"
            }, {
                "gP",
                "<Plug>(YankyGPutBefore)",
                mode = {"n", "x"},
                desc = "Put yanked text before selection"
            }, {
                "[y",
                "<Plug>(YankyCycleForward)",
                desc = "Cycle forward through yank history"
            }, {
                "]y",
                "<Plug>(YankyCycleBackward)",
                desc = "Cycle backward through yank history"
            }, {
                "]p",
                "<Plug>(YankyPutIndentAfterLinewise)",
                desc = "Put indented after cursor (linewise)"
            }, {
                "[p",
                "<Plug>(YankyPutIndentBeforeLinewise)",
                desc = "Put indented before cursor (linewise)"
            }, {
                "]P",
                "<Plug>(YankyPutIndentAfterLinewise)",
                desc = "Put indented after cursor (linewise)"
            }, {
                "[P",
                "<Plug>(YankyPutIndentBeforeLinewise)",
                desc = "Put indented before cursor (linewise)"
            },
            {
                ">p",
                "<Plug>(YankyPutIndentAfterShiftRight)",
                desc = "Put and indent right"
            },
            {
                "<p",
                "<Plug>(YankyPutIndentAfterShiftLeft)",
                desc = "Put and indent left"
            }, {
                ">P",
                "<Plug>(YankyPutIndentBeforeShiftRight)",
                desc = "Put before and indent right"
            }, {
                "<P",
                "<Plug>(YankyPutIndentBeforeShiftLeft)",
                desc = "Put before and indent left"
            },
            {
                "=p",
                "<Plug>(YankyPutAfterFilter)",
                desc = "Put after applying a filter"
            },
            {
                "=P",
                "<Plug>(YankyPutBeforeFilter)",
                desc = "Put before applying a filter"
            }
        }
    }

}
