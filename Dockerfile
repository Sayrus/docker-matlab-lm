# sayrus/docker-matlab-r2018
# VERSION 1.0.0

FROM debian

MAINTAINER Mathis RAGUIN <mathisraguin@hotmail.fr>

ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/MatLab/2018a/etc:/usr/local/MatLab/2018a/bin:$PATH

RUN echo "TZ='Europe/Paris'; export TZ" >> /root/.bashrc

# Required package
RUN apt-get update && apt-get install -y --fix-missing lsb

# Matlab r2018
RUN adduser --disabled-password --gecos '' matlab
ADD matlab_R2018a_glnxa64 /root/
ADD entry.sh /root/bin/

# Required files
COPY license.lic /root/license.lic

RUN chmod -R 755 /root/bin/entry.sh
RUN chmod -R 755 /root/install

# Installer input
ARG KEY
RUN sed -i "s,^# fileInstallationKey=,fileInstallationKey=$KEY," /root/installer_input.txt

# Setup configuration
RUN sed -i "s,^# destinationFolder=,destinationFolder=\/usr\/local\/MatLab\/2018a/," /root/installer_input.txt
RUN sed -i "s,^# agreeToLicense=,agreeToLicense=yes," /root/installer_input.txt
RUN sed -i "s,^# licensePath=,licensePath=\/root\/license.lic," /root/installer_input.txt
RUN sed -i "s,^# lmgrFiles=,lmgrFiles=true," /root/installer_input.txt
RUN sed -i "s,^# mode=,mode=silent," /root/installer_input.txt

# Activate
RUN sed -i "s,^activateCommand=,activateCommand=activateOffline," /root/activate.ini
RUN sed -i "s,^licenseFile=,licenseFile=\/root\/license.lic," /root/activate.ini


ENTRYPOINT ["/root/bin/entry.sh"]
