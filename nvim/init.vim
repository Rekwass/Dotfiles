if has('win64') || has('win32') || has('win16')
    source $HOME/Appdata/Local/nvim/settings.vim
    lua require('impatient')
    luafile $HOME/Appdata/Local/nvim/lua/config.lua
else
    source $HOME/.config/nvim/settings.vim
    lua require('impatient')
    luafile $HOME/.config/nvim/lua/config.lua
endif
