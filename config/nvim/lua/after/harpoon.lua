-- configure here
local harpoon = require("harpoon")

-- Required
harpoon.setup({})
-- Required

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>j", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():next() end)


vim.keymap.set("n", "<C-q>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })



-- optimize with tmux https://github.com/ThePrimeagen/harpoon
