local M = {}

function M.setup()
    vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
            border = "rounded",
            source = "always",
        },
    })

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    vim.keymap.set("n", "<C-w>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
    vim.keymap.set("n", "<C-w><C-d>", vim.diagnostic.open_float, { desc = "Line diagnostics" })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local buf = event.buf
            local bufmap = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
            end

            bufmap("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
            bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
            bufmap("n", "<leader>cf", vim.lsp.buf.format, "Format")

            bufmap("n", "gd", vim.lsp.buf.definition, "Goto definition")
            bufmap("n", "gt", vim.lsp.buf.type_definition, "Goto type definition")
            bufmap("n", "gI", vim.lsp.buf.implementation, "Goto implementation")
            bufmap("n", "K", vim.lsp.buf.hover, "Knowledge")

            local refs = require("telescope.builtin").lsp_references
            bufmap("n", "gr", refs, "References")

            bufmap({ "n", "x" }, "gq", function()
                vim.lsp.buf.format({ async = true })
            end, "Format via LSP")
        end,
    })

    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp and vim.lsp.config then
        vim.lsp.config("*", {
            capabilities = cmp_nvim_lsp.default_capabilities(),
        })
    end

    local ok_mason, mason = pcall(require, "mason")
    if ok_mason then
        mason.setup()
    end

    local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
    if ok_mason_lsp then
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "pyright",
                "ts_ls",
                "rust_analyzer",
                "bashls",
                "jsonls",
                "yamlls",
                "html",
                "cssls",
                "sqlls",
            },
            automatic_installation = true,
            automatic_enable = true,
        })
    end

    if vim.lsp.config then
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                        },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        vim.lsp.config("gopls", {
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
        })

        vim.lsp.config("pyright", {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })

        vim.lsp.config("sqlls", {
            root_markers = { ".git", "docker-compose.yml", "compose.yml", ".sqllsrc.json" },
        })

        vim.lsp.config("gdscript", {
            filetypes = { "gd", "gdscript", "gdscript3" },
        })
    end

    local ok_null_ls, null_ls = pcall(require, "null-ls")
    if ok_null_ls then
        pcall(function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "black",
                    "isort",
                    "sql-formatter",
                    "prettier",
                },
            })
        end)

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "html",
                        "json",
                        "yaml",
                        "markdown",
                        "graphql",
                        "md",
                        "txt",
                    },
                }),

                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces" },
                }),

                null_ls.builtins.formatting.black,
                -- null_ls.builtins.formatting.isort,

                null_ls.builtins.formatting.nixfmt,

                null_ls.builtins.formatting.goimports,

                null_ls.builtins.formatting.sql_formatter,
            },
        })
    end
end

M.setup()

return M
