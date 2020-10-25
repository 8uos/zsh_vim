ARG CUDNN="7"
ARG CUDA="10.0"

FROM nvidia/cuda:${CUDA}-cudnn${CUDNN}-devel-ubuntu18.04

# install basics
RUN apt-get update -y && apt-get install -y --no-install-recommends language-pack-en 
RUN apt-get install -y apt-utils rename git ssh tmux curl ca-certificates bzip2 cmake tree htop bmon iotop g++ 
RUN apt-get install -y libglib2.0-0 libsm6 libxext6 libxrender1 libfontconfig1 iputils-ping 

# setting for zsh and vim (sanghyuk.c)
RUN apt-get install -y zsh vim \
&& git clone https://github.com/8uos/zsh_vim.git /zsh_vim \
&& bash /zsh_vim/tmux_config.sh \
&& bash /zsh_vim/vim_config.sh \
&& bash /zsh_vim/zsh_config.sh

# Install Miniconda
ENV CONDA_ROOT=/conda
RUN curl -so /miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
&& chmod +x /miniconda.sh \
&& /miniconda.sh -b -p $CONDA_ROOT \
&& rm /miniconda.sh

ENV PATH=$CONDA_ROOT/bin:$PATH

RUN conda install ipython jupyter numpy pandas matplotlib tqdm pyyaml scipy cython jupyterlab nodejs
RUN pip install psutil requests ninja yacs opencv-python sklearn scikit-image fire lmdb sconf
RUN pip install ffmpeg imageio-ffmpeg easydict

# Install PyTorch
RUN conda install pytorch torchvision cudatoolkit=10.0 -c pytorch
# Downgrade pillow for torchvision
RUN pip install Pillow==6.1.0

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV LANGUAGE=C.UTF-8

WORKDIR /workspace
RUN chmod -R a+w /workspace

RUN ipython profile create \
&& cp -f /zsh_vim/ipython_config.py ~/.ipython/profile_default/ipython_config.py \
&& rm -r /zsh_vim \
&& chsh -s '/bin/zsh'
