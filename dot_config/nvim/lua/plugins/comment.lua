return function()
	require("Comment").setup({
		---Add a space b/w comment and the line
		padding = true,
		---Whether the cursor should stay at its position
		sticky = true,
		---Lines to be ignored while (un)comment
		ignore = nil,
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = "<leader>c<space>",
		},
		---LHS (Left Hand Side) of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = "<leader>c",
		},
	})

	vim.api.nvim_create_autocmd("BufEnter", {
		desc = "Disable comment on new line",
		group = vim.api.nvim_create_augroup("disable-comment-new-line", { clear = true }),
		command = "set formatoptions-=cro"
	})
end
