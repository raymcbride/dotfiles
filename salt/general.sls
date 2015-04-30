general-pkgs:
  pkg.installed:
    - names:
      - build-essential
      - linux-headers-{{ salt["cmd.run"]("uname -r") }}
      - python-dev
      - python-pip
      - python-software-properties
      - python-virtualenv
      - unzip

general-python-pkgs:
  pip.installed:
    - names:
      - psutil
      - distribute
      - virtualenv
    - upgrade: True
