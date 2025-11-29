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
=======
            source = true,
        },
    })

    -- Diagnostic Keymaps
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
    end, { desc = "Prev diagnostic" })
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
    end, { desc = "Next diagnostic" })
    vim.keymap.set("n", "<C-w>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
    vim.keymap.set("n", "<C-w><C-d>", vim.diagnostic.open_float, { desc = "Line diagnostics" })

    -- 2. Setup LspAttach
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
>>>>>>> eb947f0 (Add configs)
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
=======
            local ok_telescope, builtin = pcall(require, "telescope.builtin")
            if ok_telescope then
                bufmap("n", "gr", builtin.lsp_references, "References")
            else
                bufmap("n", "gr", vim.lsp.buf.references, "References")
            end
>>>>>>> eb947f0 (Add configs)

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

=======
    -- 3. Capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities()
    end

    -- 4. Setup Mason (Standard)
    require("mason").setup()

    -- 5. Setup Mason-LSPConfig (v2.0 Style)
    -- note: automatic_installation handle the "ensure_installed" logic
    require("mason-lspconfig").setup({
        -- ensure_installed = {
        --     "lua_ls",
        --     "gopls",
        --     "pyright",
        --     "ts_ls",
        --     "rust_analyzer",
        --     "bashls",
        --     "jsonls",
        --     "yamlls",
        --     "html",
        --     "cssls",
        --     "sqlls",
        -- },
        automatic_installation = true, -- Auto-install configured servers
    })

    -- 6. Configure Servers
    vim.lsp.config("*", {
        capabilities = capabilities,
    })

    -- Lua Configuration
    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME },
                },
                telemetry = { enable = false },
            },
        },
    })

    -- Go Configuration
    vim.lsp.config("gopls", {
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = { unusedparams = true },
            },
        },
    })

    -- Python Configuration
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

    -- SQL Configuration
    vim.lsp.config("sqlls", {
        root_markers = { ".git", "docker-compose.yml", "compose.yml", ".sqllsrc.json" },
    })

    -- GDScript (Manual setup since not managed by Mason)
    -- If GDScript is in path, just enable it
    vim.lsp.enable("gdscript")
    -- Configure it
    vim.lsp.config("gdscript", {
        capabilities = capabilities,
        filetypes = { "gd", "gdscript", "gdscript3" },
    })

    -- 7. Null-LS / None-LS Setup
    local ok_null_ls, null_ls = pcall(require, "null-ls")
    if ok_null_ls then
        local ok_mason_null, mason_null_ls = pcall(require, "mason-null-ls")
        if ok_mason_null then
            mason_null_ls.setup({
                ensure_installed = { "black", "isort", "sql-formatter", "prettier" },
            })
        end
>>>>>>> eb947f0 (Add configs)
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

=======
                null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.nixfmt,
                null_ls.builtins.formatting.goimports,
>>>>>>> eb947f0 (Add configs)
                null_ls.builtins.formatting.sql_formatter,
            },
        })
    end
end

M.setup()

return M
