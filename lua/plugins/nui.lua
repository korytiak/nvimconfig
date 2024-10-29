return {
    {
        "folke/noice.nvim", -- Replace with the actual plugin path if needed
        dependencies = { "nui.nvim" },
        config = function()
            require("avante").setup({
                -- Your configuration options here
            })
        end,
    },
    { "MunifTanjim/nui.nvim" },  -- Add nui.nvim here
}

