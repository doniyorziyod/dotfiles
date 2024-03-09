return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
      dir = "~/Documents/mybrain/",
      notes_subdir = "notes",
      disable_frontmatter = true,
      templates = {
          subdir = "meta/templates/",
          date_format = "%Y-%m-%d",
          time_format = "%H:%M",
          substitutions = {
              yesterday = function()
                  return os.date("%Y-%m-%d", os.time() - 86400)
              end
          },
      },
      daily_notes = {
          folder = "notes/dairy/daily/",
          template = "daily.md"
      },
      note_id_func = function(title)
          local suffix = ""
          if title ~= nil then
              suffix = title
          else
              suffix = tostring(os.time())
          end
          return suffix
      end,
      -- set to current
      open_notes_in = "vsplit",
      ui = {
          enable = false,  -- set to false to disable all additional syntax features
          update_debounce = 200,  -- update delay after a text change (in milliseconds)
          -- Define how various check-boxes are displayed
          checkboxes = {
              -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
              [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
              ["x"] = { char = "", hl_group = "ObsidianDone" },
              [">"] = { char = "", hl_group = "ObsidianRightArrow" },
              ["-"] = { char = "󰰱", hl_group = "ObsidianTilde" },
              -- Replace the above with this if you don't have a patched font:
              -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
              -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
              -- You can also add more custom ones...
              },
              -- Use bullet marks for non-checkbox lists.
              bullets = { char = "•", hl_group = "ObsidianBullet" },
              external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
              -- Replace the above with this if you don't have a patched font:
              -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
              reference_text = { hl_group = "ObsidianRefText" },
              highlight_text = { hl_group = "ObsidianHighlightText" },
              tags = { hl_group = "ObsidianTag" },
              block_ids = { hl_group = "ObsidianBlockID" },
              hl_groups = {
                  -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                  ObsidianTodo = { bold = true, fg = "#f78c6c" },
                  ObsidianDone = { bold = true, fg = "#89ddff" },
                  ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                  ObsidianTilde = { bold = true, fg = "#ff5370" },
                  ObsidianBullet = { bold = true, fg = "#89ddff" },
                  ObsidianRefText = { underline = true, fg = "#c792ea" },
                  ObsidianExtLinkIcon = { fg = "#c792ea" },
                  ObsidianTag = { italic = true, fg = "#89ddff" },
                  ObsidianBlockID = { italic = true, fg = "#89ddff" },
                  ObsidianHighlightText = { bg = "#75662e" },
              },
          },
          attachments = {
              -- The default folder to place images in via `:ObsidianPasteImg`.
              -- If this is a relative path it will be interpreted as relative to the vault root.
              -- You can always override this per image by passing a full path to the command instead of just a filename.
              img_folder = "meta/files/",  -- This is the default
              -- A function that determines the text to insert in the note when pasting an image.
              -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
              -- This is the default implementation.
              ---@param client obsidian.Client
              ---@param path obsidian.Path the absolute path to the image file
              ---@return string
              img_text_func = function(client, path)
                  local link_path
                  local vault_relative_path = client:vault_relative_path(path)
                  if vault_relative_path ~= nil then
                      -- Use relative path if the image is saved in the vault dir.
                      link_path = vault_relative_path
                  else
                      -- Otherwise use the absolute path.
                      link_path = tostring(path)
                  end
                  local display_name = vim.fs.basename(link_path)
                  return string.format("![%s](%s)", display_name, link_path)
              end,
          },
      },
}
