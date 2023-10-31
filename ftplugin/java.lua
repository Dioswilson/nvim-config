-- local config = {
--     cmd = { "/home/dioswilson1/.local/share/nvim/mason/packages/jdtls/bin/jdtls" },
--     root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
-- }
-- require("jdtls").start_or_attach(config)
local jdtlsDir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local configDir = jdtlsDir .. "/config_linux"
local pluginsDir = jdtlsDir .. "plugins/"
local pathToJar = pluginsDir .. "org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"

local rootDir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])

local projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspaceDir = vim.fn.stdpath("data") .. "site/java/workspace-root/" .. projectName
os.execute("mkdir -p " .. workspaceDir)

local jdtlsExe=jdtlsDir .. "/bin/jdtls"

local config = {
    cmd = {
        jdtlsExe,
        "java",
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- 💀
        "-jar",
        pathToJar,
        -- 💀
        "-configuration",
        configDir,
        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        workspaceDir,
    },
    root_dir = rootDir,

    settings = {
        java = {
            home = "/usr/lib/jvm/java-17-openjdk",
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                -- runtimes = {
                -- {
                --     name = "JavaSE-18",
                --     path = "/Users/ivanermolaev/Library/Java/JavaVirtualMachines/temurin-18.0.1/Contents/Home",
                -- },
                -- {
                --     name = "JavaSE-17",
                --     path = "/Users/ivanermolaev/Library/Java/JavaVirtualMachines/temurin-17.0.4/Contents/Home",
                -- },
                -- },
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },

            signatureHelp = { enabled = true },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                importOrder = {
                    "java",
                    "javax",
                    "com",
                    "org",
                },
            },
            extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
    },

    flags = {
        allow_incremental_sync = true,
    },
    init_options = {
        bundles = {},
    },
}
require("jdtls").start_or_attach(config)
