# arch-config
My personal Arch Linux configuration.

## Instructions
1 - [Install Arch Linux.](https://wiki.archlinux.org/title/Installation_guide)

2 - Log in as root.

3 - Copy or clone the repo:
```bash
# cd /root 
# git clone https://github.com/valentinoamato/arch-config.git
```
4 - Run [rootsetup.sh](./scripts/rootsetup.sh):

This script will ask for a name, then create a new user and move the repo to its home directory.
```bash
# cd arch-config/scripts
# ./rootsetup.sh
```
5 - Log in as the new user.

6 - Run [usersetup.sh](./scripts/usersetup.sh):

This will install all the required packages and apply the configuration for the new user.
It can also be used later to apply updates after pulling changes.
```bash
$ cd ~/arch-config/scripts/
$ ./usersetup.sh
```
7 - Reboot the system:
```bash
# systemctl reboot
```

## See also
- [General Recommendations](https://wiki.archlinux.org/title/General_recommendations)


    
## License

This project is licensed under the [Unlicense](./LICENSE).
