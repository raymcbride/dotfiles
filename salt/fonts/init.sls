fonts-dir:
  file.directory:
    - name: ~/fonts
    - makedirs: True

~/.fonts/PowerlineSymbols.otf:
  file.managed:
    - source: salt://fonts/fonts/PowerlineSymbols.otf
    - require:
      - file: fonts-dir

~/.fonts/Ubuntu-Mono-derivative-Powerline.ttf:
  file.managed:
    - source: salt://fonts/fonts/Ubuntu-Mono-derivative-Powerline.ttf
    - require:
      - file: fonts-dir

system-fc-cache:
  cmd.run:
    - name: fc-cache -vf
    - requires:
      - file: fonts-dir
    - require_in:
      - file: config-dir

config-dir:
  file.directory:
    - name: ~/.config/fontconfig/conf.d
    - makedirs: True

~/.config/fontconfig/conf.d/10-powerline-symbols.conf:
  file.managed:
    - source: salt://fonts/10-powerline-symbols.conf
    - require:
      - file: config-dir
