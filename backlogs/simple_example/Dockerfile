# for tansy server
From nvidia/cuda:10.1-cudnn7-devel

ENV HOME /root
SHELL ["/bin/bash", "-l", "-c"]
RUN set -x \
	&& apt update -y \
	&& apt install -y git curl wget htop tmux vim\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
#
RUN set -x \
	&& wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
	&& bash Miniconda3-latest-Linux-x86_64.sh -b

ENV PATH ${HOME}/miniconda3/bin:$PATH
RUN conda update conda

RUN set -x \
	&& conda create -n py38 python=3.8 \
	&& echo "source activate py38" >> ~/.bashrc
# wrapt はtensorflowのエラー修正
RUN set -x \
	&& source activate py38 \
	&& conda install pytorch torchvision cudatoolkit=10.1 -c pytorch \
	&& conda install jupyter jupyterlab matplotlib \
	&& pip install --upgrade pip \
	&& conda install wrapt \
	&& pip install tensorboard

# 個人設定
RUN set -x \
	&& source activate py38 \
	&& conda install nodejs \
	&& pip install tensorflow jupyter-tensorboard tensorboardX jupyterlab-nvdashboard \
	&& jupyter tensorboard enable --user
RUN set -x \
	&& source activate py38 \
	&& jupyter labextension install jupyterlab_tensorboard \
	&& jupyter labextension install jupyterlab-nvdashboard
# removed jupyterlab-vim for obsolete

# pixyzのインストールは手動でお願いします

WORKDIR $HOME
COPY pixyz_start.sh pixyz_start.sh
# ENTRYPOINT /entrypoint.sh
# CMD [ '/bin/bash' ]
CMD ["/bin/bash", "pixyz_start.sh"]

