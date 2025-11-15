FROM jupyter/scipy-notebook:latest

# Switch to root to install system packages if needed
USER root

# Install extra build tools if want to compile C++ manually too
RUN apt-get update && \
    apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/*

# Back to the default notebook user
USER $NB_UID

# Install xeus-cling C++ kernel
# This gives C++11, C++14, C++17 kernels in JupyterLab
RUN conda install -y -c conda-forge xeus-cling && \
    conda clean -afy