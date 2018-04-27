# Docker Matlab LM
A simple Docker for Matlab License Manager
## Installation
Copy `license.lic` at the root of this repository.

Extract Matlab installer in a folder called `matlab_R2018_glnxa64`. This should
be the default name of the license manager.

Replace `KEY`, `mac_address` and `hostname`  in `docker-compose.yml` to match
your license.

You should now have at least the following files and folders:
```
./docker-compose.yml
./Dockerfile
./license.lic
./matlab_R2018_glnxa64/
./entry.sh
```

Run `docker-compose up` and you're done.

## Notes
### Ports

The port 27000 is the default port for Flexnet. However, fixing MLM's port to
1711 is a choice.
This can be changed by editing `docker-compose.yml` and `entry.sh`.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

