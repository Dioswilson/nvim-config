return {
    "nvim-telescope/telescope-frecency.nvim",
    dependecies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("telescope").load_extension("frecency")
    end,
}
