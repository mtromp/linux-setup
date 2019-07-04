# Working with tmux plugins
```bash
## create .tmux.conf after cloning tmux plugin manager: https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

vi ~/.tmux.conf

	# List of plugins: NOTE starting single-quote and ending single-quote
  set -g @tpm_plugins '          \
    tmux-plugins/tpm             \
    tmux-plugins/tmux-sensible   \
    tmux-plugins/tmux-pain-control \
    tmux-plugins/tmux-resurrect  \
  '

	 # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
	run '~/.tmux/plugins/tpm/tpm'

# To activate the new configuration type the following within a tmux session:
tmux source ~/.tmux.conf

# verify that the plugins are successfully loaded by typing
<tmux-prefix> I  # capital I. Will see that the plugins are installed.
## now <tmux-prefix> - //will split the screen horizontally.
```

If you use the tmux.conf file that is in this directory, be aware that:
- the <tmux-prefix\> is changed from CTRL-b to CTRL-q
- to use the `tmux.conf` file copy it to your home director as `.tmux.conf`

## Scroll content not history
By default, the up arrow and mouse scroll wheel will scroll through the shell history.
To allow scrolling through the content in the pane, use <tmux-prefix\> [ to switch to
'mouse copy mode.' To exit use the ESC key on the prompt line.
