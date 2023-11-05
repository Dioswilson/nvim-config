return {
    "mhartington/formatter.nvim",
    config = function()
        -- Utilities for creating configurations
        local util = require("formatter.util")

        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = {
                    function()
                        return {
                            exe = "stylua",
                            args = {
                                "--search-parent-directories",
                                "--config-path",
                                "/home/dioswilson1/.config/nvim/formattersConfig/stylua.toml",
                                "--stdin-filepath",
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--",
                                "-",
                            },
                            stdin = true,
                        }
                    end,
                },
                c = {
                    function()
                        return {
                            exe = "clang-format",
                            args = {
                                "-assume-filename=" .. util.get_current_buffer_file_name(),
                            },
                            stdin = true,
                            cwd = "/home/dioswilson1/.config/nvim/formattersConfig",
                        }
                    end,
                },
                cpp = {
                    function()
                        return {
                            exe = "clang-format",
                            args = {
                                "-assume-filename=" .. util.get_current_buffer_file_name(),
                            },
                            stdin = true,
                            cwd = "/home/dioswilson1/.config/nvim/formattersConfig",
                        }
                    end,
                },
                java = {
                    -- require("formatter.filetypes.java").clangformat
                    function()
                        return {
                            exe = "clang-format",
                            args = {
                                "-assume-filename=" .. util.get_current_buffer_file_name(),
                            },
                            stdin = true,
                            cwd = "/home/dioswilson1/.config/nvim/formattersConfig",
                        }
                    end,
                },
                yaml = {
                    require("formatter.filetypes.yaml").prettier,
                },
                toml = {
                    require("formatter.filetypes.toml").taplo,
                },
                ["*"] = {
                    -- "formatter.filetypes.any" defines default configurations for any
                    -- filetype
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                },
            },
        })
    end,
}
