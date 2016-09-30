# Manchester Accelerator Physics - Geant4 Docker Image
Dockerfile for our Geant4 image, based on our baseline image. Uses Geant4 version 10.1.p02.

This repository contains a single file (apart from this readme) which is the Dockerfile used to build our Geant4 docker image, found [here]().

This image is based on our baseline image, information about which can be found [here](https://github.com/manacc/dockerfiles-baseline).

## Geant4 compile details
The version of Geant4 compiled here is version 10.1.p02. The following options are set using an initial CMake cache (found [here](https://github.com/afg1/Geant4-install))

- Install prefix: **/usr/local**
- Multithreaded Build: **OFF**
- Install Data: **ON**
- Use Qt: **OFF**
- Use OpenGL X11: **OFF**
- Use GDML: **ON**
- Store Trajectory: **OFF**
- Verbose Code: **OFF**
- System Expat: **OFF**

These choices are made to make the installation useful on most docker hosts, and suitable for use with BDSIM. Another Geant4 image with multithreading enabled is also being prepared.

