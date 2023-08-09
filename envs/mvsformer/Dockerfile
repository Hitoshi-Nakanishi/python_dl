FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        make build-essential cmake less git wget curl zsh emacs vim tmux htop tzdata \
        libcairo2-dev libzmq3-dev libgl1-mesa-dev ca-certificates libjpeg-dev libpng-dev \
	mesa-utils x11-apps x11-xserver-utils dbus xorg-dev libglu1-mesa-dev xvfb libstdc++6 \
	unzip zip m4 swig graphviz && \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/zsh", "-c"]
RUN wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN conda update -y conda && \
    conda install -n base conda-libmamba-solver && \
    conda config --set solver libmamba && \
    conda init zsh && \
    source ~/.zshrc && \
    conda activate base && \
    conda install -y python=3.9 numpy pandas scipy matplotlib seaborn scikit-learn tqdm && \
    conda install -y jupyterlab scikit-image imageio pillow moviepy -c conda-forge && \
    conda install -y dill pyzmq protobuf && \
    conda install -y pytorch=1.13.1.post200 torchvision pytorch-cuda=11.6 -c pytorch -c nvidia && \
    conda install -y tensorboardx progressbar2 ipdb yapf black && \
    conda clean -ya && \
    pip install opencv-python && \
    pip install jax==0.4.6 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html && \
    pip install jaxlib==0.4.6 flax==0.6.3 && \
    pip install tensorflow==2.9.1 && \
    pip install chex optax absl-py clu ml-collections einops && \
    pip install tensorflow-datasets tensorflow-addons && \
    pip install timm && \
    pip install PyYAML dill sexpdata pygame pycairo cairocffi psutil pypng Box2D-kengz graphviz frozendict pathos && \
    pip install plyfile omegaconf configargparse && \
    pip install torchinfo gpuutils

ARG SERVER_NAME="X37"
ARG JUPYTER_PATH=/root/.jupyter/jupyter_lab_config.py
RUN jupyter lab --generate-config && ipython profile create
RUN echo "c.ServerApp.ip = '*'" >> $JUPYTER_PATH && \
    echo "c.ServerApp.open_browser = False" >> $JUPYTER_PATH && \
    echo "c.ServerApp.password = 'sha1:7338924eb686:b219e86a5e482c9490fd860be0d34924b17a1c00'" >> $JUPYTER_PATH && \
    echo "c.ServerApp.base_url = '/$SERVER_NAME/'" >> $JUPYTER_PATH && \
    echo "c.ServerApp.base_project_url = '/$SERVER_NAME/'" >> $JUPYTER_PATH && \
    echo "c.ServerApp.webapp_settings = {'static_url_prefix':'/$SERVER_NAME/static/'}" >> $JUPYTER_PATH && \
    echo "c.InteractiveShellApp.matplotlib = 'inline'" >>/root/.ipython/profile_default/ipython_config.py && \
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/conda/lib" >> /root/.zshrc && \
    echo "export CUDA_HOME=/usr/local/cuda" >> /root/.zshrc

RUN conda init zsh

WORKDIR /notebooks/DockerShared
CMD ["zsh"]

# if you want to run jupyter lab, please call below. port 8888 is open.
# CMD jupyter lab --ip=0.0.0.0 --port=8888 --allow-root
# if you want to run tensorboard, please call below. port 6006 is open.
# CMD tensorboard --logdir=<your logging directory>
