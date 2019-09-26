# ARK Core - Docker

<p align="center">
    <img src="https://github.com/ARKEcosystem/core-docker/blob/master/banner.png" />
</p>

## [Production setup](production/README.md)

## Development setup

> Please run `generate-dev.sh` in order to generate ARK Core Docker files

```
bash generate-dev.sh
```

**NOTE**

This by default generates all Docker dev files with token `ark`. If you prefer a different token name, just add it as an extra argument to the script:

```
bash generate-dev.sh MyToken
```

_In case you need to start with a clean Database:_

```bash
docker-compose down -v
docker-compose up -d
```

### Serve ARK Core as a Collection of Containers

**Run a PostgreSQL container, build and run ARK Core using a mounted volume.**

During container start your locally cloned ARK Core folder is being [mounted](https://docs.docker.com/storage/volumes/) inside the container. This configuration works well when developing ARK Core itself, as you do not need to rebuild the container to test your changes.

**WARNING**
The build process expectes your locally cloned ARK Core git folder location to be `~/core` or it will fail.

_Along with PostgreSQL container, you also have a NodeJS container which mounts your local ARK Core git folder inside the container and installs all NPM prerequisites._

> Let's build and run the containers:

```bash
cd docker/development/$NETWORK      # (NETWORK = testnet || devnet)
docker-compose up -d
```

_You can now enter your ark-core container and use NodeJS in a Docker container (Linux environment)._

```bash
docker exec -it $TOKEN-$NETWORK-core bash   # (NETWORK = testnet || devnet, default TOKEN is `ark`)
```

_In case you need to start with a clean Database:_

```bash
docker-compose down -v postgres
docker-compose up -d postgres


_Need to start everything from scratch and make sure there are no remaining cached containers, images or volumes left? Just use the **purge_all.sh** script._

**WARNING**
Development files/presets are not Production ready. Official Production ARK-Core Docker images are now available at [Docker Hub](https://hub.docker.com/r/arkecosystem/core).

## [Windows Development setup](windows/README.md)

## Security

If you discover a security vulnerability within this package, please send an e-mail to security@ark.io. All security vulnerabilities will be promptly addressed.

## Credits

This project exists thanks to all the people who [contribute](../../contributors).

## License

[MIT](LICENSE) © [ARK Ecosystem](https://ark.io)
