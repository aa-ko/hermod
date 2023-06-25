# Hermod
Super simple Valheim server info dashboard. 

## Development
Test hermod locally using Docker.

Specify the IP or hostname of your Valheim server in place of `MYVALHEIMSERVER`.


1. Build the image: `docker build -t hermod:dev .`
2. Run: `docker run --rm -p 8089:8081/tcp -e VALHEIM_URI="MYVALHEIMSERVER:26010" --name hermod-dev hermod:dev`

## TODO 
- Replace screenshots with the images from the official press kit.
- Make a dark theme.
- Show live server logs in the bottom. This might require a backend that attaches to the logs of the server container. Attach to that via websocket.
