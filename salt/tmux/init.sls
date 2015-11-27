vim:
  pkg:
    - installed

~/.vimrc:
  file.managed:
    - source: salt://tmux/.tmux.conf
    - template: jinja
    - require:
      - pkg: tmux
