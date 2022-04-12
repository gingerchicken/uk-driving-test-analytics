#!/bin/bash
# Start docker
sudo systemctl start docker

# Get the notebooks path
notebooks_dir=$(dirname $(realpath $0))

echo "Using notebook directory: $notebooks_dir"

sudo docker run \
    -i -t -p 8888:8888 \
    -v $notebooks_dir:/opt/notebooks \
    continuumio/anaconda3 /bin/bash -c "\
        conda install jupyter -y --quiet && \
	jupyter notebook \
        --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
        --no-browser --allow-root"
