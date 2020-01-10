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
    "C_Cpp.updateChannel": "Insiders",
    "cmake.configureOnOpen": false,
    "editor.fontFamily": "'monaco', monaco",
    "editor.fontSize": 14,
    "editor.formatOnSave": true,
    "editor.suggestSelection": "first",
    "editor.wordWrapColumn": 320,
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
    "go.useLanguageServer": true,
    "java.configuration.checkProjectSettingsExclusions": false,
    "java.errors.incompleteClasspath.severity": "ignore",
    "java.jdt.ls.vmargs": "-noverify -Xmx1G -XX:+UseG1GC -XX:+UseStringDeduplication -javaagent:\"/Users/nalbam/.vscode/extensions/gabrielbb.vscode-lombok-0.9.9/server/lombok.jar\"",
    "javascript.updateImportsOnFileMove.enabled": "always",
    "python.jediEnabled": false,
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
