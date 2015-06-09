vim:
  pkg:
    - installed

~/.vimrc:
  file.managed:
    - source: salt://vim/.vimrc
    - template: jinja
    - require:
      - pkg: vim
