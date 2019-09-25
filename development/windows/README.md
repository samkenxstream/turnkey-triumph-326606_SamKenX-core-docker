#Windows Development Environment

It's possible to use your favorite Windows IDE locally and build, test and run ARK Core in a native Linux environment. This can be done by using [Docker for Windows](https://docs.docker.com/docker-for-windows/).

## Prerequisites

- [Docker Desktop for Windows](https://docs.docker.com/docker-for-windows/install)
- [Docker Compose](https://docs.docker.com/compose/install/)  

## Configuration

> Once you installed [Docker Desktop for Windows](https://docs.docker.com/docker-for-windows/install) you'll have to configure _Shared Drives_ so your Linux container can mount ARK Core repository cloned locally on your Windows system. 
Make sure your firewall and antivirus are turned off or configured to allow the above operation. Follow [Docker Documentation](https://docs.docker.com/docker-for-windows/) - section _Shared Drives_.

**IMPORTANT!**
To avoid Windows and Unix format end of lines mess [EOL](https://en.wikipedia.org/wiki/Newline). Prior to clonning ARK Core repository, enter the following code in your command prompt or PowerShell:

```
git config --global core.eol lf
git config --global core.autocrlf input
```

**NOTE**

Unless your IDE has a speciall setting to preserve Unix format EOL, every file you edit and save in Windows will be converted to Windows format i.e. it will be CRLF instead of LF. You must preserve Unix file format by all means as otherwise you'll face issues when running Core in your Docker container.

> Clone [ARK Core](https://github.com/ArkEcosystem/core.git) repository. Recommended branch to use for development is `develop`.

Our example uses `D:\core` as a PATH, so if you do not want to edit `docker-compose.yml`, you just go ahead and clone [core-docker](https://github.com/ArkEcosystem/core-docker.git) to the same path.

> Clone [core-docker](https://github.com/ArkEcosystem/core-docker.git) repository.

**NOTE** if you cloned ARK Core to any other PATH different than `D:\core` you'll have to edit `docker-compose.yml` to match the path:

```
cd core-docker/development/windows
```

Open `docker-compose.yml` and:

_Change:_

```
   volumes:
     - d:/core:/core
```
_To:_

```
   volumes:
     - d:/your_local_path_to_core:/core
```

## Running your container

> Open PowerShell as Administrator and enter the following code:

```
cd core-docker/development/windows
docker-compose up -d
```

> Entering the container:

```
docker exec -it ark-testnet-core bash
```

> You can now build and run ARK Core from inside the container. Example:

_Build:_

```
cd /core
yarn setup
```

_Run:_

```
cd /core/packages/core
yarn full:testnet
```
