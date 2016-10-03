FROM manacc/baseline:1.1

# Create and switch to a temporary build directory
RUN mkdir /var/tmp/builds
WORKDIR /var/tmp/builds

# To do a full Geant4 install, we need a library for XML parsing. Unfortunately
# it is not in the Alpine repositories, so we build it here
RUN mkdir xerces
WORKDIR /var/tmp/builds/xerces
RUN wget http://apache.mirror.anlx.net//xerces/c/3/sources/xerces-c-3.1.4.tar.gz && gzip -d xerces-c-3.1.4.tar.gz && tar -xf xerces-c-3.1.4.tar
WORKDIR /var/tmp/builds/xerces/xerces-c-3.1.4
RUN ./configure && make && make install

WORKDIR /var/tmp/builds
RUN mkdir geant4
WORKDIR /var/tmp/builds/geant4
RUN wget http://geant4.cern.ch/support/source/geant4.10.02.p02.tar.gz && gzip -d geant4.10.02.p02.tar.gz && tar -xf geant4.10.02.p02.tar
RUN mkdir geant4-build
WORKDIR /var/tmp/builds/geant4/geant4-build

RUN wget https://raw.githubusercontent.com/afg1/Geant4-install/master/initial-cache.cmake && cmake -C initial-cache.cmake ../geant4.10.02.p02/
RUN make  && make install
WORKDIR /
RUN rm -rf /var/tmp/builds
ENTRYPOINT /bin/bash
