# Dotfiles  

---

## Neovim Config setup (Linux)

### Install [Neovim](https://github.com/neovim/neovim)

- Download appimage
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
```

- Make appimage executable
```bash
chmod u+x nvim.appimage
```

- Move appimage to somewhere in path, for example /usr/bin
```bash
sudo mv nvim.appimage /usr/bin/nvim
```

- Test if neovim works (you might have to reopen the terminal
```bash
nvim
```

### Install [vim-plug](https://github.com/junegunn/vim-plug)

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Get my [Neovim config](https://github.com/marvhus/dotfiles/blob/dev/init.vim)
(or my [2nd config](https://raw.githubusercontent.com/marvhus/dotfiles/dev/.vimrc), remember to rename it to nit.vim`. Note: this has other keybinds than the first one mentioned, and I'm not yet verry familiar with them, so you'll have to read through them yourself)
- Make directory for it to be in
```bash
mkdir ~/.config/nvim -p
```

- Move to directory
```bash
cd ~/.config/nvim
```

- Download config
```bash
curl -LO wget https://raw.githubusercontent.com/marvhus/dotfiles/dev/init.vim
```

### Get vim-plug pluggins installed

- Open Neovim
```bash
nvim
```

- Install pluggins
```bash
:PlugInstall
```

- If you get errors about YouCompleteMe, then you have to install it, if not then you can just leave it be.

### Install [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)

- Move to directory
```bash
cd ~/.config/nvim/autoload/plugged/YouCompleteMe
```

- Install dependencies
```bash
apt install build-essential cmake vim-nox python3-dev
apt install mono-complete golang nodejs default-jdk npm
```

- Install YouCompleteMe
```bash
python3 install.py --all
```


Now Neovim should be up and running.

## Neovim keybinds

| Keybind               | Description                 |
|-----------------------|-----------------------------|
| ctrl + p              | Git files                
| space + p + f         | Find files               
| space + p + b         | Find files in buffer     
| space + v + h         | Help search   
| space + v + s + enter | Vertical split 
| space + h + s + enter | Horizontal split
| space + t + s + enter | Vertical split with terminal ( to exit press Ctrl + \ Ctrl + n )
| Ctrl + H              | Move left
| Ctrl + J              | Move down
| Ctrl + K              | Move up
| Ctrl + L              | Move right
| space + w + enter     | Save
| space + q + enter     | Quit             

---
