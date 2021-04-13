FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    make build-essential cmake \
    git wget curl zsh emacs \
    tmux htop \
    ocaml opam m4 libcairo2-dev libzmq3-dev swig graphviz \
    ca-certificates \
    libjpeg-dev libpng-dev && \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/zsh", "-c"]
RUN wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

RUN opam init -y --auto-setup --comp 4.06.1 && \
    opam update && \
    eval `opam config env` && \
    # eval $(opam env) && \
    opam switch set 4.06.1+flambda && \
    # opam switch create 4.06.1+flambda && \
    eval `opam config env` && \
    # eval $(opam env) && \
    opam install -y  ppx_jane core re2 yojson vg cairo2 camlimages menhir ocaml-protoc zmq utop jbuilder

RUN echo '#use "topfind";;' >> /root/.ocamlinit && \
    echo '#thread;;' >> /root/.ocamlinit && \
    echo '#require "core.top";;' >> /root/.ocamlinit && \
    echo '#require "core.syntax";;' >> /root/.ocamlinit && \
    echo 'open Core;;' >> /root/.ocamlinit && \
    echo 'open Core;;' >> /root/.ocamlinit && \
    echo 'eval `opam config env`' >> /root/.zshrc

RUN wget https://downloads.python.org/pypy/pypy3.7-v7.3.4-linux64.tar.bz2 && \
    tar xjvf pypy3.7-v7.3.4-linux64.tar.bz2 && \
    rm pypy3.7-v7.3.4-linux64.tar.bz2 && \
    mv pypy3.7-v7.3.4-linux64 /root && \
    echo 'PATH=/root/pypy3.7-v7.3.4-linux64/bin:$PATH' >> /root/.zshrc
ENV PATH /root/pypy3.7-v7.3.4-linux64/bin:$PATH
RUN pypy3 -m ensurepip && \
    pypy3 -m pip install dill vmprof psutil

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN conda update -y conda && \
    conda install -y python=3.8 numpy pandas scipy matplotlib seaborn scikit-learn tqdm tensorflow-gpu=2.2 && \
    conda install -y dill pyzmq protobuf && \
    conda install -y pytorch torchvision -c pytorch && \
    conda install -y scikit-image jupyterlab moviepy -c conda-forge && \
    conda clean -ya && \
    pip install PyYAML tensorboardX && \
    pip install dill sexpdata pygame pycairo cairocffi psutil pypng Box2D-kengz graphviz frozendict pathos && \
    pip install gpuutils && \
    pip install opencv-python

ARG SERVER_NAME="X37"
RUN jupyter notebook --generate-config && ipython profile create
RUN echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.password = 'sha1:7338924eb686:b219e86a5e482c9490fd860be0d34924b17a1c00'" >> \
        /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.base_url = '/$SERVER_NAME/'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.base_project_url = '/$SERVER_NAME/'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.webapp_settings = {'static_url_prefix':'/$SERVER_NAME/static/'}" >> \
        /root/.jupyter/jupyter_notebook_config.py && \
   echo "c.InteractiveShellApp.matplotlib = 'inline'" >>/root/.ipython/profile_default/ipython_config.py

EXPOSE 8888
EXPOSE 6006
WORKDIR /notebooks/DockerShared
CMD ["zsh"]

# if you want to run jupyter lab, please call below. port 8888 is open.
# CMD jupyter lab --ip=0.0.0.0 --port=8888 --allow-root
# if you want to run tensorboard, please call below. port 6006 is open.
# CMD tensorboard --logdir=<your logging directory>
