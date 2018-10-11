# Working with tmux plugins
```bash
## create .tmux.conf after cloning tmux plugin manager: https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

vi ~/.tmux.conf

	# List of plugins
	set -g @plugins 'tmux-plugins/tpm'
	set -g @plugins 'tmux-plugins/tmux-sensible'
	set -g @plugins 'tmux-plugins/tmux-resurrect'
	set -g @plugins 'tmux-plugins/tmux-pain-control'
	
	 # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
	run '~/.tmux/plugins/tpm/tpm'
	
# within a tmux session:
tmux source ~/.tmux.conf
<tmux-prefix> I  # capital I. Will see that the plugins are installed.
## now <tmux-prefix> - //will split the screen horizontally.
```
