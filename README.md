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
```
brew install marksman
```
```
brew install go
```
```
brew install gopls
```
```
brew install ripgrep
```

Backup your nvim config first, then remove it.

```
rm -rf ~/.config/nvim:w

```

Clone to ~/.config

```
git clone https://github.com/korytiak/nvimconfig.git ~/.config/nvim
```

