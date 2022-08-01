set nocompatible

filetype plugin indent on   " https://vi.stackexchange.com/a/10125

syntax enable               " enable syntax highlighting

set termguicolors           " Enable 24-bit colors
set cursorline              " Highlight current line

set foldmethod=expr         " Expression based folding (nerdsitter)
set foldexpr=nvim_treesitter#foldexpr() " If anything breaks, use zx
set foldlevel=99            " Sets default folding level to 99

set number                  " Display line numbers
set relativenumber          " Print offset from highlighted line
set scrolloff=15            " Make the cursor see x lines above cursor
set showbreak=↪             " Show line wrapping character
set pumheight=15            " Maximum number of items to show in the popup menu

set smartcase               " Use smartcase when searching

set shiftwidth=2            " Number of spaces for auto-indent
set tabstop=2               " Number of spaces per tab
set expandtab               " Insert spaces instead of tabs
set smartindent             " Automatically indents on patterns (e.g.: {, })
set noautochdir             " Stop changing my directory >:C
set shellcmdflag=-ic 	      " Allows vim to find the aliases from my .zshrc


" Backup, undo and swapfiles
set backup
set undofile
set noswapfile
set undodir=/tmp/undo/
set backupdir=/tmp/backup/

let g:instant_username = "Nicolas"

" Create those directories if needed
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
