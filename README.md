Install language servers:

```
dotnet tool install --global csharp-ls
```
```
npm install -g typescript typescript-language-server
```
```
brew install lua-language-server
```

Backup your nvim config first, then remove it.

```
rm -rf ~/.config/nvim
```

Clone to ~/.config

```
git clone https://github.com/korytiak/nvimconfig.git ~/.config/nvim
```

Go into /lua/sveto/packer.lua and source and sync plugins:

```
:so
:PackerSync
```
