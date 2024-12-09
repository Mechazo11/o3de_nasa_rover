# Docker script to build the O3DE_NASA_ROVER_SIM project

Author: Azmyin Md. Kamal
Version: 1.0
Date: 09/09/2024
Project page: https://github.com/Mechazo11/O3DE_CURIOSITY_ROVER_SIM

This directory contains the Dockerfile instructions for creating the ```TODO``` image that showcases Curiosity rover navigating through a clutterd test environment inspired by JPL's Mars Yard testing ground.

Version 1: This project was created as a submission to the NASA Space ROS Sim Summer Sprint Challenge 2024. Checkout the project page for more details.

## Prerequisits

* ROS 2 Humble

## Build instruction

**WARNING** At least have 60 - 80 GB of free disk space and since it builds Moveit2 and Demo_ws before building the whole O3DE project, expect at least 3 - 4 hours for the build process to complete.

* First build the image.
```bash
git clone https://github.com/Mechazo11/o3de_nasa_rover
cd /o3de_nasa_rover
./build.sh
```

* Install Nvidia Container toolkit and run configuration as discussed here: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html. If you don't have it open a terminal and do the following

* Make sure you have --runtime nvidia configured. If not this sample example will do it: ```sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi```

## Run the demo

* Use ```docker ps -a``` to check if you have a container running ```simualtion/o3de_mars_rover``` running. A useful command that stops and removes all containers is ```docker rm $(docker ps -aq)```

We will need three terminals. Lets call them Termianls A, B and C respectively.

* Terminal A, run the following

```bash
xhost +local:docker
./run.sh
```

* Terminal B, find container id and then attach it

```bash
docker ps -a
docker exec -it <container_id> /bin/bash
```

* Terminal C, attach it to container

```bash
docker exec -it <container_id> /bin/bash
```

You should see the following setup

<img src="docs/terminals.png" alt="description" style="float: left; width: 200; height: auto;" />

* In Terminal A, launch the O3DE app: ```./build/linux/bin/profile/Editor```

* Hit the play button (right arrow symbol top right)

* **IMOPRTANT** in Game mode, the mouse dissappears. To get it back , hit ```Ctrl+TAB``` keys.

* In Terminal B and C, first source DEMO_WS: ```source $DEMO_DIR/install/setup.bash```
* In Terminal B: ```ros2 launch mars_rover mars_rover_o3de.launch```
* In Terminal C: ```ros2 service call /move_forward std_srvs/srv/Empty```

If you did eveything correclty, you should see the following

<img src="docs/output.png" alt="description" style="float: left; width: 200; height: auto;" />

Now the rover will move forward.
