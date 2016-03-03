bash:
  pkg:
    - installed

~/.bashrc:
  file.managed:
    - source: salt://bash/.bashrc
    - template: jinja
    - require:
      - pkg: bash
