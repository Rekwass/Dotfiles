local M = {}

M.configuration = {
    cmd = { 'cmake-language-server' },
    filetypes = { 'cmake' },
    root_markers = { 'CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake' },
    init_options = {
        buildDirectory = 'build',
    },
}

return M
