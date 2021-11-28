FROM compdatasci/petsc-desktop:18.04

WORKDIR /tmp

# 先裝pyqt所需的相關套件
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends\
    qt5dxcb-plugin \
    python3-dev python3-pip python3-setuptools python3-wheel

RUN pip3 install setuptools-rust && \
    pip3 install --upgrade pip

# 裝pyqt+spyder環境
RUN pip3 install -U \
          matplotlib \
        #   sympy==1.1.1 \
          scipy \
          pandas \
        #   nose \
        #   sphinx \
        #   breathe \
          cython \
        #   autopep8 \
        #   flake8 \
          pylint \
        #   flufl.lock \
        #   ply \
          pytest \
          six \
          PyQt5==5.12.2 \
          spyder \
          urllib3 \
          requests \
          pylint

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
