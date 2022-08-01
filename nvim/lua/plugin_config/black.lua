return function ()

  vim.cmd([[
    augroup black_on_save
      autocmd!
      autocmd FileType python autocmd BufWritePre <buffer> Black
    augroup end
  ]])

end
