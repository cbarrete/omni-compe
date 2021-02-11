# omni-compe

## Usage


```lua
-- pick what filetypes omnicompletion should be used for
require('omni_compe').setup({ 'tex' })

require('compe').setup({
    source = {
        omni = true,
        -- probably some other sources as well
    }
})
```
