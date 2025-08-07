local function navigate_buffers(direction)
	local current_buf = vim.api.nvim_get_current_buf()
	local next_buf = current_buf
	repeat
		vim.cmd(direction == "next" and "bnext" or "bprevious")
		next_buf = vim.api.nvim_get_current_buf()
	until vim.api.nvim_buf_get_option(next_buf, "buftype") ~= "terminal" or next_buf == current_buf
end

function MoveSelectionToFile()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])
	local current_file_dir = vim.fn.expand("%:p:h") .. "/"
	local filename = vim.fn.input("Save selection to file: ", current_file_dir)
	vim.fn.writefile(lines, filename)
	vim.api.nvim_buf_set_lines(0, start_pos[2] - 1, end_pos[2], false, {})
	vim.cmd("edit " .. filename)
end

vim.keymap.set("n", "<C-j>", function()
	navigate_buffers("next")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", function()
	navigate_buffers("previous")
end, { noremap = true, silent = true })

vim.g.mapleader = " "
vim.keymap.set("t", "<C-j>", "<C-\\><C-n> :bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n> :bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<Leader>gd", function()
	vim.lsp.buf.definition()
	vim.cmd("normal! zt")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<Leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Leader>w", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.api.nvim_set_keymap("v", "<leader>mf", ":lua MoveSelectionToFile()<CR>", { noremap = true, silent = true })
