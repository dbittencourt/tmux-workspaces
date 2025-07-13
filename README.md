# tmux-workspaces

A simple workspace manager based on tmux sessions and fzf.

It provides a helper to create/select workspaces with four default windows:
code, server, git and ai.

![image](./img/tmux-windows.png)

tmux-workspaces will open a fzf popup screen where you can type the name of new session or select
an existing one. If you are creating a new session, fzf will prompt you the default directory for
all windows.

## Dependencies

- [tpm](https://github.com/tmux-plugins/tpm)
- [fzf](https://github.com/junegunn/fzf)

## Installation

Edit your .tmux.conf file and include the snippet bellow:

```conf
# create/manage workspaces using sessions
set -g @plugin 'dbittencourt/tmux-workspaces'

# initialize tmux plugin manager (this should be the last line of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

Afterwards, type your tmux prefix + `Ctrl-I` so tpm can download it locally.

## Default mappings

The default mappins rely on the alt key. They work just fine in linux but if you are a macos user,
you need to enable it through something like [karabiner elements](https://github.com/pqrs-org/Karabiner-Elements).
Here are some rules I set for karabiner so it can work on macos: [karabiner config](https://github.com/dbittencourt/dotfiles/blob/main/karabiner/.config/karabiner/assets/complex_modifications/1738705043.json).

- Alt + ` (grave): Trigger tmux-workspaces. You can type the name of a new workspace or select and
  switch to an existing one.

![image](./img/tmux-workspaces.png)

- Alt + 1: Switch to window 1 (code);
- Alt + 2: SWitch to window 2 (server);
- Alt + 3: Switch to window 3 (git);
- Alt + 4: Switch to window 4 (ai).
