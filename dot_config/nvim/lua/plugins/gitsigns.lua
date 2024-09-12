return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs                        = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged                 = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged_enable          = true,
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            follow_files = true
        },
        auto_attach                  = true,
        attach_to_untracked          = false,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
            -- Options passed to nvim_open_win
            border = 'rounded',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },

        on_attach                    = function(bufnr)
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    require('gitsigns').nav_hunk('next')
                end
            end, { desc = "Go to next hunk" })

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    require('gitsigns').nav_hunk('prev')
                end
            end, { desc = "Go to previous hunk" })

            -- Actions
            map('n', '<leader>hs', require('gitsigns').stage_hunk, { desc = "Stage current chunk" })
            map('n', '<leader>hu', require('gitsigns').undo_stage_hunk, { desc = "Undo stage current chunk" })
            map('n', '<leader>hr', require('gitsigns').reset_hunk, { desc = "Reset current chunk" })
            map('v', '<leader>hs', function() require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "Stage selected chunk" })
            map('v', '<leader>hr', function() require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "Reset selected chunk" })
            map('n', '<leader>hS', require('gitsigns').stage_buffer, { desc = "Stage current buffer" })
            map('n', '<leader>hR', require('gitsigns').reset_buffer, { desc = "Reset current buffer" })
            map('n', '<leader>hp', require('gitsigns').preview_hunk, { desc = "Preview current chunk changes" })
            map('n', '<leader>hb', function() require('gitsigns').blame_line { full = true } end, { desc = "Git blame" })
            map('n', '<leader>tb', require('gitsigns').toggle_current_line_blame, { desc = "Toggle git blame" })
            map('n', '<leader>hd', require('gitsigns').diffthis, { desc = "Run vimdiff against the index" })
            map('n', '<leader>hD', function() require('gitsigns').diffthis('~') end,
                { desc = "Run vimdiff against latest commit" })
            map('n', '<leader>td', require('gitsigns').toggle_deleted, { desc = "Toggle deleted lines" })
        end
    }
}
