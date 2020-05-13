FRoM fedora:latest

ENV REPO   https://github.com/KrumpetPirate/AAXtoMP3.git
ENV COMMIT 60bf8b0d8786f52619565c05262cdd0e39624a29

RUN export FEDORA_VER=$(grep -Eo '[[:digit:]]+' /etc/fedora-release); \
    mkdir src; \
    dnf install -y \
      https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VER}.noarch.rpm \
      https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${FEDORA_VER}.noarch.rpm; \
    dnf install -y \
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
