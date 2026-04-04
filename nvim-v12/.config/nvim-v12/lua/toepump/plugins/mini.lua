return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.ai').setup { n_lines = 500 }
        require('mini.surround').setup()
        require('mini.pairs').setup()
        require('mini.notify').setup()
        require('mini.files').setup {
            -- Customization of explorer windows
            windows = {
                -- Maximum number of windows to show side by side
                max_number = math.huge,
                -- Whether to show preview of file/directory under cursor
                preview = true,
                -- Width of focused window
                width_focus = 30,
                -- Width of non-focused window
                width_nofocus = 30,
                -- Width of preview window
                width_preview = 100,
            },
        }

        -- Mini.Files toggle open/close
        vim.keymap.set('n', '<leader>t', function()
            -- This opens mini.files in the directory of the current file
            if not MiniFiles.close() then
                MiniFiles.open(vim.api.nvim_buf_get_name(0))
            end
        end, { desc = '[T]oggle Mini Files' })

        local statusline = require 'mini.statusline'
        statusline.setup {
            use_icons = vim.g.have_nerd_font,
            -- toepump: This is a custom configuration (w/ ChatGPT help), to make the filename shorter.
            -- It makes the filename use relative path instead of absolute. Change `%:.` to `%:t` for only filename.
            -- There is a block for the filename shown for the active buffer as well as the inactive buffer.
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
                    local filename = vim.fn.expand '%:.' -- relative path
                    local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
                    local location = MiniStatusline.section_location { trunc_width = 75 }

                    return MiniStatusline.combine_groups {
                        { hl = mode_hl, strings = { mode } },
                        { hl = 'MiniStatuslineFilename', strings = { filename } },
                        '%<',
                        '%=', -- ⬅️ this pushes the rest to the right
                        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                        { hl = 'MiniStatuslineLocation', strings = { location } },
                    }
                end,
                inactive = function()
                    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
                    local filename = vim.fn.expand '%:.' -- relative path
                    local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
                    local location = MiniStatusline.section_location { trunc_width = 75 }

                    return MiniStatusline.combine_groups {
                        { hl = mode_hl, strings = { mode } },
                        { hl = 'MiniStatuslineFilename', strings = { filename } },
                        '%<',
                        '%=', -- ⬅️ this pushes the rest to the right
                        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                        { hl = 'MiniStatuslineLocation', strings = { location } },
                    }
                end,
            },
        }

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return '%2l:%-2v'
        end
    end,
}
