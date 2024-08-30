vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<Leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<Leader>o', '<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<Leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Leader>p", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
