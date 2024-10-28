return {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-live-grep-args.nvim',
        },
        config = function()
                local telescope = require('telescope')
                telescope.setup({

                })

                vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, {})
                vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})
                vim.keymap.set('n', '<leader>fs', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })

                telescope.load_extension('live_grep_args')
        end,
}
