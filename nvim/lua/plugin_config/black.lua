return function ()

  vim.api.nvim_create_autocmd({"Filetype", "BufWritePre"}, {
    group = "black_on_save",
    pattern = "python",
    command = "Black",
  })

end
