ARG CUDNN="7"
ARG CUDA="10.0"

FROM nvidia/cuda:${CUDA}-cudnn${CUDNN}-devel-ubuntu18.04

# install basics
RUN apt-get update -y 
RUN apt-get install -y apt-utils git curl ca-certificates bzip2 cmake tree htop bmon iotop g++ 
RUN apt-get install -y libglib2.0-0 libsm6 libxext6 libxrender1 libfontconfig1 iputils-ping 

# setting for zsh and vim (sanghyuk.c)
RUN apt-get install -y zsh vim \
&& git clone https://github.com/8uos/zsh_vim.git /zsh_vim \
&& bash /zsh_vim/vim_config.sh \
&& bash /zsh_vim/zsh_config.sh \
&& rm -r /zsh_vim

# Install Miniconda
RUN curl -so /miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
&& chmod +x /miniconda.sh \
&& /miniconda.sh -b -p /miniconda \
&& rm /miniconda.sh

ENV PATH=/miniconda/bin:$PATH

# Create a Python 3.8 environment
RUN /miniconda/bin/conda install -y conda-build \
&& /miniconda/bin/conda create -y --name py38 python=3.8 \
&& /miniconda/bin/conda clean -ya

ENV CONDA_DEFAULT_ENV=py38
ENV CONDA_PREFIX=/miniconda/envs/$CONDA_DEFAULT_ENV
ENV PATH=$CONDA_PREFIX/bin:$PATH
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility
# Dab adding for color enviroment
ENV TERM xterm-256color

RUN conda update -n base -c defaults conda
RUN conda install -y ipython numpy pandas matplotlib tqdm pyyaml scipy cython jupyterlab
RUN pip install psutil requests ninja yacs opencv-python sklearn scikit-image fire lmdb sconf
RUN pip install ffmpeg imageio-ffmpeg easydict

# Install PyTorch
RUN conda install pytorch torchvision cudatoolkit=10.0 -c pytorch \
&& conda clean -ya
# Downgrade pillow for torchvision
RUN pip install Pillow==6.1.0

ENV PYTHONPATH=/workspace
ENV LC_ALL=C.UTF-8
# Dab adding
ENV LANG=C.UTF-8
ENV LANGUAGE=C.UTF-8

WORKDIR /home
RUN chmod -R a+w /home
