vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'},
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            local telescope = require("telescope")

            -- first setup telescope
            telescope.setup({
                -- your config
            })

            -- then load the extension
            telescope.load_extension("live_grep_args")
        end
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('neovim/nvim-lspconfig')
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'f-person/auto-dark-mode.nvim'
    use 'rose-pine/neovim'
    use 'Exafunction/codeium.vim'
end)
