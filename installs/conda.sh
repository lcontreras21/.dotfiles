#!/bin/bash
#Download Miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/install-miniconda.sh
sudo -A chmod 550 /tmp/install-miniconda.sh

# Create install directory
conda_dir="/opt/miniconda3"
sudo -A mkdir -p $conda_dir
sudo -A chmod -R 755 $conda_dir
sudo -A chown -R $USER $conda_dir

# Run the installer
sudo -A /tmp/install-miniconda.sh -b -u -p $conda_dir

# Remove the installer
sudo -A rm /tmp/install-miniconda.sh

# Initialize Conda
${conda_dir}/bin/conda init bash
${conda_dir}/bin/conda init zsh
