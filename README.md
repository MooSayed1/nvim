
# Custom Neovim Configuration

This repository contains a custom Neovim configuration based on the [NvChad](https://github.com/NvChad/NvChad) framework, with modifications such as additional plugins and configurations.

## Prerequisites

- Neovim (v0.8.0 or higher)
- Git
- [Packer](https://github.com/wbthomason/packer.nvim) (or your preferred package manager, e.g., Lazy.nvim if using it)
- **Optional**: Additional dependencies for LSP, Treesitter, etc. (these will be installed automatically via `mason.nvim`)

## Installation

### Step 1: Clone the Repository

Clone this repository to your local machine in your Neovim configuration folder (usually located in `~/.config/nvim/`):

```bash
git clone https://github.com/Moosayed1/nvim.git ~/.config/nvim
```

### Step 2: Install Plugins

If using Lazy.nvim, run the following command to install and sync plugins:

1. Open Neovim:

   ```bash
   nvim
   ```

2. Run the following Lazy.nvim command to install all plugins:

   ```vim
   :Lazy sync
   ```

### Step 3: Verify Configuration

Ensure that all necessary dependencies and plugins are correctly installed by checking the Neovim log messages:

```vim
:checkhealth
```

If there are any issues, ensure that `Lazy.nvim` has installed all required plugins by running:

```vim
:Lazy update
```

## Folder Structure

The structure of the configuration is as follows:

```
.
├── init.lua                 # Entry point of the configuration
├── lazy-lock.json           # Lock file for Lazy.nvim plugins
├── lua
│   ├── chadrc.lua           # Main configuration file for customizing NvChad
│   ├── configs              # Folder for specific module configurations
│   │   ├── conform.lua
│   │   ├── lazy.lua         # Plugin manager configuration
│   │   └── lspconfig.lua    # LSP settings
│   ├── mappings.lua         # Key mappings
│   ├── options.lua          # Neovim options
│   └── plugins
│       └── init.lua         # Plugin list and configuration
└── template                 # Project templates
    ├── CPP
    └── CPP.cpp
```

## Customizations

### Plugin Management

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. The list of plugins and their configurations can be found in `lua/plugins/init.lua`. You can add or remove plugins here according to your needs.

### Key Mappings

Custom key mappings are defined in `lua/mappings.lua`. Feel free to modify or add mappings to match your workflow.

### LSP Configuration

Language server settings are configured in `lua/configs/lspconfig.lua`. This file also integrates the `mason.nvim` package to automatically manage LSP installations. You can add more servers by modifying the `lspconfig.lua` file.

## Troubleshooting

If you encounter issues with missing dependencies or incorrect configurations, follow these steps:

1. **Ensure all plugins are installed**:
   Run `:Lazy sync` or `:Lazy update` in Neovim to install missing plugins.

2. **Check Neovim logs**:
   Use `:messages` to view error logs or run Neovim with verbose mode:

   ```bash
   nvim -V3log
   ```

3. **Plugin conflicts**:
   Ensure that your `lua/chadrc.lua` file correctly references the custom configuration files. Cross-check paths to avoid errors.

4. **Health check**:
   Run `:checkhealth` to diagnose issues related to missing dependencies (like LSPs or Treesitter parsers).

## Contributing

Feel free to open issues or submit pull requests if you encounter bugs or want to suggest improvements.

