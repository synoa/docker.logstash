# docker.logstash
> Synoa Logstash image. See [hub.docker.com/r/synoa/logstash](https://hub.docker.com/r/synoa/logstash/)

This repository holds the Dockerfile for building the Synoa Logstash Image.
Images are autmatically build and published on [hub.docker.com/r/synoa/logstash](https://hub.docker.com/r/synoa/logstash/).
Each Docker Tag lives inside its own Branch which represents the version number,
e.g. branch `5.2.1` for Logstash `5.2.1`. 

## Triggering a new build

To trigger a new build or re-build an existing tag create or update the
associated branch. If Logstash publishs a 6.0 release, create a Dockerfile for
this release and push it to a branch named `6.0`. At the moment images only
install the `logstash-input-beats` and `logstash-output-elasticsearch` plugins.
Everything else is configured with the `logstash.conf` files.

## Usage

Create a new `logstash.conf` file and mount it into the `/logstash-config/`
directory when running a container, e.g. 

```sh
$ docker run --rm -p "1337:5044" -v "$(pwd)/config:/logstash-config/" synoa/logstash:5.2.1
```

The above command will run Logstash 5.2.1 on port 1337 with your logstash config
from a `config` directory in the current directory.
