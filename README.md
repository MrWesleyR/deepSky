
<div align="center">
 <img width="150" height="150" alt="Duck-ai-image-2026-10-05-18-49" src="https://github.com/user-attachments/assets/6ce91a13-f121-4cae-b002-632f590637e6" />
</div>


## Get Started

### [Built-in vim.pack](https://neovim.io/doc/user/pack/#_plugin-manager)

``` lua
use {
vim.pack.add({
	{
		src = "https://github.com/MrWesley/deepsky",
		name = "deepSky",
	},
})
require("deepSky").setup()
vim.cmd("colorscheme deepSky")}
```

## [pam.vim](https://github.com/mvllow/pam.nvim)
``` lua
{ source = "rose-pine/neovim", as = "rose-pine" }
```

## [lazy.nvim](https://lazy.folke.io/installation)
``` lua
-- lua/plugins/deepSky.lua
return {
	"MrWesleyR/deepsky",
	name = "deepSky",
	config = function()
		vim.cmd("colorscheme deepSky")
	end
}
```
## Single file
``` lua 
{ "rose-pine/neovim", name = "rose-pine" }
```

### Preview

<img width="897" height="465" alt="2026-10-05_19-00" src="https://github.com/user-attachments/assets/68a91681-71dc-4c55-aa73-5da37d572b72" />

--- 

- If you see any bug open issue please.
- Pull requests are welcome.
