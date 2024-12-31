# VSCode dotfiles

### `settings.json` and `keybindings.json`
 - `settings.json` contains configs for the interactions within vscode, *not* the appearance.
 - `keybindings.json` contains custom keyboard shortcuts.

To install these configurations:

```
# OSX
$ cp *.json ${HOME}/Library/Application\ Support/Code/User/.

# Ubuntu
$ cp *.json  $HOME/.config/Code/User/.
```

### Color Theme
The `frugalized-dark` color theme is the GOAT. To install, symlink into the proper application configs:

```
# OSX

$ ln -s ${WKSPC}/dotfiles/vscode/theme-frugalized-dark ~/.vscode/extensions/theme-frugalized-dark
```

