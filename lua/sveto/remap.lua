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

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Function to move selected text to a new file in the current file's directory and delete it
function MoveSelectionToFile()
    -- Get the start and end position of the visual selection
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    -- Get the lines from the selection
    local lines = vim.fn.getline(start_pos[2], end_pos[2])

    -- Get the directory of the current file
    local current_file_dir = vim.fn.expand('%:p:h') .. '/'

    -- Prompt the user for a file name
    local filename = vim.fn.input("Save selection to file: ", current_file_dir)

    -- Write the selected lines to the file
    vim.fn.writefile(lines, filename)

    -- Delete the selected text
    vim.api.nvim_buf_set_lines(0, start_pos[2] - 1, end_pos[2], false, {})

    -- Open the new file in the current window
    vim.cmd('edit ' .. filename)
end

-- Map the function to <leader>mf in visual mode
vim.api.nvim_set_keymap('v', '<leader>mf', ':lua MoveSelectionToFile()<CR>', { noremap = true, silent = true })

