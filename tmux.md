# tmux

## install

```bash
sudo apt install -y tmux

sudo brew install tmux
```

## config

```bash
vi ~/.tmux.conf
```

```text
set-option -g mouse on
set-option -g history-limit 10000
bind \ split-window -h -c '#{pane_current_path}'  # Split panes horizontal
bind - split-window -v -c '#{pane_current_path}'  # Split panes vertically
```
