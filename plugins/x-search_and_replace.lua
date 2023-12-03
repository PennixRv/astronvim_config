return {
    --- 使用Rust-sad项目编写的搜索和替换工具 https://github.com/ray-x/sad.nvim
    --- 前置要求：
    --- cargo install --locked --all-features --git https://github.com/ms-jpq/sad --branch senpai
    --- sudo dnf install fzf
    --- cargo install fd-find
    {
        "ray-x/sad.nvim",
        dependencies = {"ray-x/guihua.lua", build = "cd lua/fzy && make"},
        opts = {},
        event = "User AstroFile",
        cmd = {"Sad"}
    }
}
