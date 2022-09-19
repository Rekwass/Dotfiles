return function ()

  vim.api.nvim_create_autocmd("FileType", {
    desc = "Format python on write using black",

    pattern = "python",
    group = vim.api.nvim_create_augroup("black_on_save", { clear = true }),
    callback = function (opts)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = opts.buf,
        command = "Black",
      })
    end,
  })

end
