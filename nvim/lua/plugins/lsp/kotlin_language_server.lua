local M = {}

local root_files = {
    'settings.gradle',     -- Gradle (multi-project)
    'settings.gradle.kts', -- Gradle (multi-project)
    'build.xml',           -- Ant
    'pom.xml',             -- Maven
    'build.gradle',        -- Gradle
    'build.gradle.kts',    -- Gradle
}

M.configuration = {
    filetypes = { 'kotlin' },
    root_markers = root_files,
    cmd = { vim.uv.os_uname().version:match("Windows") and 'kotlin-language-server.cmd' or 'kotlin-language-server' },
    init_options = {
        -- Enables caching and use project root to store cache data.
        storagePath = vim.fs.root(vim.fn.expand '%:p:h', root_files),
    }
}

return M
