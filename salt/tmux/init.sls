tmux:
  pkg:
    - installed

~/.tmux.conf:
  file.managed:
    - source: salt://tmux/.tmux.conf
    - template: jinja
    - require:
      - pkg: tmux
