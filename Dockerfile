FRoM fedora:latest

ENV REPO   https://github.com/KrumpetPirate/AAXtoMP3.git
ENV COMMIT 60bf8b0d8786f52619565c05262cdd0e39624a29

RUN source /etc/os-release; \
    mkdir src; \
    dnf install -y \
      https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${VERSION_ID}.noarch.rpm \
      https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${VERSION_ID}.noarch.rpm; \
    dnf install -y \
      bc \
      ffmpeg \
      findutils \
      git \
      lame \
      libmp4v2; \
    dnf clean all

RUN git clone ${REPO} repo; \
    cd repo; \
    git checkout ${COMMIT}

VOLUME /src

WORKDIR /src

ENTRYPOINT ["/repo/AAXtoMP3"]
