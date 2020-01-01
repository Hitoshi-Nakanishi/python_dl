FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu16.04
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        emacs \
        tmux \
        htop \
        ca-certificates \
        libjpeg-dev \
        libpng-dev &&\
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
   /bin/bash ~/miniconda.sh -b -p /opt/conda && \
   rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN conda update -y conda && \
   conda install -y python=3.7 numpy scipy matplotlib seaborn scikit-learn tqdm pandas tensorflow-gpu=1.12 && \
   conda install -y pytorch torchvision -c pytorch && \
   conda install -y scikit-image jupyterlab moviepy -c conda-forge && \
   conda clean -ya && \
   pip install tensorboardX

ARG SERVER_NAME="server_name"

RUN jupyter notebook --generate-config && \
   ipython profile create

RUN echo "c.NotebookApp.ip = '*'" >>/root/.jupyter/jupyter_notebook_config.py && \
   echo "c.NotebookApp.open_browser = False" >>/root/.jupyter/jupyter_notebook_config.py && \
   echo "c.NotebookApp.password = 'sha1:7338924eb686:b219e86a5e482c9490fd860be0d34924b17a1c00'"  >>/root/.jupyter/jupyter_notebook_config.py && \
   echo "c.NotebookApp.base_url = '/$SERVER_NAME/'" >>/root/.jupyter/jupyter_notebook_config.py && \
   echo "c.NotebookApp.base_project_url = '/$SERVER_NAME/'" >>/root/.jupyter/jupyter_notebook_config.py && \
   echo "c.NotebookApp.webapp_settings = {'static_url_prefix':'/$SERVER_NAME/static/'}" >>/root/.jupyter/jupyter_notebook_config.py && \
   echo "c.InteractiveShellApp.matplotlib = 'inline'" >>/root/.ipython/profile_default/ipython_config.py

WORKDIR /workspace
RUN chmod -R a+w /workspace
EXPOSE 8888
EXPOSE 6006

CMD jupyter lab --ip=0.0.0.0 --port=8888 --allow-root