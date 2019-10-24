# Visual Studio Code

* <https://code.visualstudio.com/>

## Extension

Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.

```bash
ext install dracula-theme.theme-dracula
ext install pkief.material-icon-theme

ext install mauve.terraform
ext install peterjausovec.vscode-docker
ext install vscjava.vscode-java-pack
ext install hookyqr.beautify
```

* <https://marketplace.visualstudio.com/publishers/Microsoft>

## Settings

```json
{
    "editor.fontFamily": "'monaco', monaco",
    "editor.fontSize": 14,
    "editor.formatOnSave": true,
    "editor.suggestSelection": "first",
    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,
    "files.autoSave": "onFocusChange",
    "files.eol": "\n",
    "files.insertFinalNewline": true,
    "files.trimFinalNewlines": true,
    "files.trimTrailingWhitespace": true,
    "git.autofetch": true,
    "git.confirmSync": false,
    "git.enableSmartCommit": true,
    "java.configuration.checkProjectSettingsExclusions": false,
    "javascript.updateImportsOnFileMove.enabled": "always",
    "scm.alwaysShowProviders": true,
    "scm.providers.visible": 20,
    "window.zoomLevel": 0,
    "workbench.colorTheme": "Dracula",
    "workbench.iconTheme": "material-icon-theme",
    "workbench.startupEditor": "newUntitledFile",
    "terraform.indexing": {
        "enabled": false,
        "liveIndexing": false,
        "delay": 500,
        "exclude": [
            ".terraform/**/*",
            "**/.terraform/**/*"
        ]
    },
    "terraform.languageServer": {
        "enabled": false,
        "args": []
    },
}
```
