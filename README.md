## requirements
- dialog
- tmux
- watch
- netcat

On a linux system, chance is that watch is already installed, but you may need to install netcat, that is used to test the availability of one port.
On debian, you'll need to install those packages:
```
apt-get install procps tmux dialog curl netcat-traditional
```
On macos, you can easily install all dependencies using brew.
About netcat, you can use either BSD version of netcat or `brew install netcat` to get it from brew.

## Configuration
Please edit file `env.sh` according to your system configuration:
- set IMMUCLIENT variable to the full path of you `immuclient` binary (e.g.: `/usr/local/bin/immuclient`)
- set IMMUDB variable to the full path of you `immudb` binary (e.g.: `/usr/local/bin/immudb`)

If you are unsure about the location of those binaries, you can check using `which`:
```sh
which immudb
```

## Docker

You can easily build a docker container to pack every requirement in a single image.
```sh
docker build -t immushow:latest .
```

To run it:
```sh
docker run -it --rm immushow:latest
```
