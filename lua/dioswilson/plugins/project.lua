return {
    "ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern", "lsp" },
            patterns = {
                ".project_root",
                ".idea",
                ".project",
                ".cproject",
                ".git",
                "_darcs",
                ".hg",
                ".bzr",
                ".svn",
                "CMakeLists.txt",
                "Makefile",
                "package.json",
                ".build.gradle",
            },
        })
    end,
}
