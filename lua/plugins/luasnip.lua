return {
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip").setup({
                -- Your configuration options here, if any
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "L3MON4D3/LuaSnip" },
        config = function()
            -- Your LSP configuration here
        end,
    },
}

