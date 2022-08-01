-- local FormatOnSave = function() print("This buffer enters") end
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = {"*.cpp", "*.hpp"},
--   callback = FormatOnSave,
-- })

vim.cmd([[
  function! Formatonsave()
    let l:formatdiff = 1
    pyf /opt/homebrew/Cellar/llvm/14.0.6_1/share/clang/clang-format.py
  endfunction
  autocmd BufWritePre *.hpp,*.cpp call Formatonsave()
]])
