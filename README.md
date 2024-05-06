# Hermod
Super simple Valheim server info dashboard.

## Installation
Assuming you're running your Valheim server via [mbround18's valheim-docker](https://github.com/mbround18/valheim-docker) which provides the necessary /status endpoint to make this dashboard work.

An example docker-compose file would look like this:
```
version: "3"
services:
  hermod:
    image: aako/hermod:0.1.3
    ports:
      - 8089:8081/tcp
    environment:
      - VALHEIM_URI="valheim:26010"

  # Your Valheim Server goes here.
```

## Development
Test hermod locally using Docker.

Specify the IP or hostname of your Valheim server in place of `MYVALHEIMSERVER`.


1. Build the image: `docker build -t hermod:dev .`
2. Run: `docker run --rm -p 8089:8081/tcp -e VALHEIM_URI="MYVALHEIMSERVER:26010" --name hermod-dev hermod:dev`

## Images
Images found in `/static` are not mine!

The `favicon.png` has been generated with [Craiyon AI](https://www.craiyon.com/).

The background images/screenshots are random finds of Valheim content from Google Image Search.

## TODO 
- Replace screenshots with the images from the official press kit.
- Make a dark theme.
- Show live server logs in the bottom. This might require a backend that attaches to the logs of the server container. Attach to that via websocket.
- Add GitHub actions for automatic builds.
- Show installed and running mods.
