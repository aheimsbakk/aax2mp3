# aax2mp3

Just a container wrapping [`KrumpetPirate / AAXtoMP3`](https://github.com/KrumpetPirate/AAXtoMP3).

## Volumes

* `src` -- work directory

## Usage

### Build

    podman build -t aax2mp3 .

### Run

    podman run -ti -v $(pwd):/src --rm aax2mp3
