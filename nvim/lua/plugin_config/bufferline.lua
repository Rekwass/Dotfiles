return function ()

local map = require("utils").map

  require("bufferline").setup {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
            or (e == "warning" and " " or " " )
          s = s .. n .. sym
        end
        return s
      end
    }
  }

-- Buffer switching
map("n", "<leader>j", ":BufferLineCyclePrev<CR>")
map("n", "<leader>l", ":BufferLineCycleNext<CR>")

-- Buffer reordering
map("n", "<leader>h", ":BufferLineMovePrev<CR>")
map("n", "<leader>k", ":BufferLineMoveNext<CR>")

end
