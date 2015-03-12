# ZSH Shared configuration

This has been mainly used on OSX, so there may need to be some changes to work with linux. Get the config on your machine using a previously downloaded version in Dropbox, or a direct clone.

```bash
# symlink zshrc folder from dropbox to home folder
ln -s ~/Dropbox/Computers/zsh ~/.zsh

# or clone to home directory
git clone https://github.com/openam/zsh.git ~/.zsh
```

Link all the files into the sytem
```bash
# link zshrc file to home directory
ln -s ~/.zsh/zshrc.sh ~/.zshrc

# link the theme
ln -s ~/.zsh/openam.zsh-theme $ZSH/themes/openam.zsh-theme
```
