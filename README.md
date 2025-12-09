💻 VLN-ViTeC Environment Setup and Execution

Environment Installation Reference Reference link: https://github.com/cshizhe/VLN-DUET

Conda Environment Activation Activate the Conda environment:

conda activate duet

Matterport3D Simulator Setup This command is required to call the Matterport3D Simulator. If you encounter the error 'Matterport' is not found, you must execute the following: Export the Matterport3DSimulator build path to PYTHONPATH:
export PYTHONPATH=/Matterport3DSimulator/build:$PYTHONPATH

Navigating to the Source Directory Change directory based on whether you are preparing for Pre-training or Fine-tuning:
For Fine-tuning:

cd ViTeC/map_nav_src

For Pre-training:

cd /ViTeC/pretrain_src

Running the Scripts The .sh file is the startup file. The testing script and the fine-tuning training script share the same .sh file. Note: When running, you must comment out one of the tasks to run the other. The paths for saving the results are all specified within the .sh file. To run Pre-training:
bash run_reverie.sh

To run Fine-tuning:

bash scripts/run_reverie.sh
