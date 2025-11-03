local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
    function(server)
        lspconfig[server].setup({
            capabilities = lsp_capabilities,
        })
    end,
        ['lua_ls'] = function(server)
        lspconfig[server].setup({
            capabilities = lsp_capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })
    end,
        ['eslint'] = function(server)
        lspconfig[server].setup({
            capabilities = lsp_capabilities,
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            settings = {
                packageManager = 'yarn'
            },
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = 'EslintFixAll'
                })
            end
        })
    end
}

local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = cmp.mapping.preset.insert({
            ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
            ['<Tab>'] = cmp.mapping(function(fallback)
            if (luasnip.jumpable(1)) then
                luasnip.jump(1)
                return
            end
            fallback()
            return nil
        end, { 'i', 's' }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = event.buf }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', '<leader>r', function() vim.lsp.buf.rename() end)
        bufmap('n', '<leader>a', function() vim.lsp.buf.code_action() end)
        bufmap('n', 'gd', function() vim.lsp.buf.definition() end)
        bufmap('n', 'gr', function() vim.lsp.buf.references() end)
        bufmap('n', 'gh', function() vim.lsp.buf.hover() end)
    end
})

local prettier = require('prettier')
prettier.setup({
        ["null-ls"] = {
        condition = function()
            return prettier.config_exists({
                -- if `false`, skips checking `package.json` for `"prettier"` key
                check_package_json = true,
            })
        end,
        timeout = 5000
    }
})

local fmt_group = vim.api.nvim_create_augroup("autoformat_cmds", { clear = true })
local function setup_autoformat(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then
        return
    end

    vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = event.buf })

    local buf_format = function(e)
        vim.lsp.buf.format({
            bufnr = e.buf,
            async = false,
            timeout_ms = 10000,
        })
    end

    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = event.buf,
        group = fmt_group,
        desc = 'Format current buffer',
        callback = buf_format,
    })

    vim.keymap.set('n', '<leader>f', function()
        buf_format({ buf = vim.api.nvim_get_current_buf() })
        if
            vim.bo.filetype == 'javascript' or
            vim.bo.filetype == 'typescript' or
            vim.bo.filetype == 'javascriptreact' or
            vim.bo.filetype == 'typescriptreact' then
            prettier.format()
        end
    end, { buffer = event.buf })
end

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Setup format on save and <leader>-f',
    callback = setup_autoformat,
})
