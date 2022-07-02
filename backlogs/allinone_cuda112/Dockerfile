FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu18.04
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    make build-essential cmake less git wget curl zsh emacs tmux htop ocaml opam m4 swig graphviz \
    libcairo2-dev libzmq3-dev libgl1-mesa-dev ca-certificates libjpeg-dev libpng-dev && \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/zsh", "-c"]
RUN wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN conda update -y conda && \
    conda install -y python=3.8 numpy pandas scipy matplotlib seaborn scikit-learn tqdm tensorflow-gpu=2.4.1 && \
    conda install -y pytorch torchvision -c pytorch && \
    conda install -y scikit-image jupyterlab moviepy -c conda-forge && \
    conda install -y dill pyzmq protobuf && \
    conda clean -ya && \
    pip install tensorflow-datasets tensorflow-addons && \
    pip install dill sexpdata pygame pycairo cairocffi psutil pypng Box2D-kengz graphviz frozendict pathos && \
    pip install "jax[cuda11_cudnn805]==0.2.25" -f https://storage.googleapis.com/jax-releases/jax_releases.html && \
    pip install flax chex optax absl-py clu ml-collections && \
    pip install PyYAML tensorboardX black && \
    pip install torchinfo einops yapf gpuutils opencv-python

ARG SERVER_NAME="X37"
RUN jupyter notebook --generate-config && ipython profile create
RUN echo "c.ServerApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.ServerApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.ServerApp.password = 'sha1:7338924eb686:b219e86a5e482c9490fd860be0d34924b17a1c00'" >> \
        /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.ServerApp.base_url = '/$SERVER_NAME/'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.ServerApp.base_project_url = '/$SERVER_NAME/'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.ServerApp.webapp_settings = {'static_url_prefix':'/$SERVER_NAME/static/'}" >> \
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
