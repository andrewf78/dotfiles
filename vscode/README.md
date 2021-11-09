# VSCode dotfiles

### `settings.json`
`settings.json` contains configs for the interactions within vscode, *not* the appearance.

To install `settings.json`:

```
$ cp settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
```

### Color Theme
The `frugalized-dark` color theme is the GOAT. To install, symlink into the proper application configs:

```
# OSX

$ ln -s ${WKSPC}/dotfiles/vscode/theme-frugalized-dark ~/.vscode/extensions/theme-frugalized-dark
```

