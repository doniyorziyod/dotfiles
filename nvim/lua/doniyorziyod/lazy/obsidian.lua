return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/mybrain",
                overrides = {
                    notes_subdir = "notes",
                },

                notes_subdir = "notes",
                log_level = vim.log.levels.INFO,

                daily_notes = {
                    folder = "notes/dairy/daily",
                    date_format = "%Y-%m-%d",
                    template = "daily"
                },

                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                },

                mappings = {
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                    ["<leader>ch"] = {
                        action = function()
                            return require("obsidian").util.toggle_checkbox()
                        end,
                        opts = { buffer = true },
                    },
                    ["<cr>"] = {
                        action = function()
                            return require("obsidian").util.smart_action()
                        end,
                        opts = { buffer = true, expr = true },
                    }
                },

                new_notes_location = "current_dir",

                ---@param title string|?
                ---@return string
                note_id_func = function(title)
                    local suffix = ""
                    if title ~= nil then
                        suffix = title
                    else
                        suffix = tostring(os.time())
                    end
                    return suffix
                end,

                wiki_link_func = function(opts)
                    return require("obsidian.util").wiki_link_id_prefix(opts)
                end,

                markdown_link_func = function(opts)
                    return require("obsidian.util").markdown_link(opts)
                end,

                preferred_link_style = "wiki",

                ---@return string
                image_name_func = function()
                    return string.format("%s-", os.time())
                end,

                disable_frontmatter = false,

                ---@return table
                note_frontmatter_func = function(note)
                    if note.title then
                        note:add_alias(note.title)
                    end

                    local out = { id = note.id, aliases = note.aliases, tags = note.tags }

                    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                        for k, v in pairs(note.metadata) do
                            out[k] = v
                        end
                    end

                    return out
                end,

                templates = {
                    folder = "meta/templates",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M",
                    substitutions = {},
                },

                ---@param url string
                follow_url_func = function(url)
                    vim.fn.jobstart({ "xdg-open", url })
                end,

                use_advanced_uri = false,

                open_app_foreground = false,

                picker = {
                    name = "telescope.nvim",
                    note_mappings = {
                        new = "<C-x>",
                        insert_link = "<C-l>",
                    },
                    tag_mappings = {
                        tag_note = "<C-x>",
                        insert_tag = "<C-l>",
                    },
                },

                sort_by = "modified",
                sort_reversed = true,

                search_max_lines = 1000,

                -- Optional, determines how certain commands open notes. The valid options are:
                -- 1. "current" (the default) - to always open in the current window
                -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
                -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
                open_notes_in = "vsplit",

                callbacks = {
                    ---@param client obsidian.Client
                    post_setup = function(client) end,

                    ---@param client obsidian.Client
                    ---@param note obsidian.Note
                    enter_note = function(client, note) end,

                    ---@param client obsidian.Client
                    ---@param note obsidian.Note
                    leave_note = function(client, note) end,

                    ---@param client obsidian.Client
                    ---@param note obsidian.Note
                    pre_write_note = function(client, note) end,

                    ---@param client obsidian.Client
                    ---@param workspace obsidian.Workspace
                    post_set_workspace = function(client, workspace) end,
                },

                ui = {
                    enable = true,          -- set to false to disable all additional syntax features
                    update_debounce = 200,  -- update delay after a text change (in milliseconds)
                    max_file_length = 5000, -- disable UI features for files with more than this many lines
                    checkboxes = {
                        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                        ["x"] = { char = "", hl_group = "ObsidianDone" },
                        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                        ["!"] = { char = "", hl_group = "ObsidianImportant" },
                    },
                    bullets = { char = "•", hl_group = "ObsidianBullet" },
                    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                    reference_text = { hl_group = "ObsidianRefText" },
                    highlight_text = { hl_group = "ObsidianHighlightText" },
                    tags = { hl_group = "ObsidianTag" },
                    block_ids = { hl_group = "ObsidianBlockID" },
                    hl_groups = {
                        ObsidianTodo = { bold = true, fg = "#f78c6c" },
                        ObsidianDone = { bold = true, fg = "#89ddff" },
                        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                        ObsidianTilde = { bold = true, fg = "#ff5370" },
                        ObsidianImportant = { bold = true, fg = "#d73128" },
                        ObsidianBullet = { bold = true, fg = "#89ddff" },
                        ObsidianRefText = { underline = true, fg = "#c792ea" },
                        ObsidianExtLinkIcon = { fg = "#c792ea" },
                        ObsidianTag = { italic = true, fg = "#89ddff" },
                        ObsidianBlockID = { italic = true, fg = "#89ddff" },
                        ObsidianHighlightText = { bg = "#75662e" },
                    },
                },

                attachments = {
                    img_folder = "meta/files", -- This is the default
                    ---@param client obsidian.Client
                    ---@param path obsidian.Path the absolute path to the image file
                    ---@return string
                    img_text_func = function(client, path)
                        path = client:vault_relative_path(path) or path
                        return string.format("![%s](%s)", path.name, path)
                    end,
                },
            },
        },
    }
}
