# Pi - Package Installer

Pi - is simple package manager written on [POSIX](https://en.wikipedia.org/wiki/POSIX) shell
for source-based (lfs) systems (althought you still can install it on any distribution).

It doesn't require any dependencies, only POSIX shell, and utils (such as mv, cp, du, install, sed, nproc, basename, etc.)

## Warning!

**Pi is under development. There is not guarantee, that pi will don't break your system!**

## Features

- No depencides.
- Stupidly simple.
- No hard reqiurement for root rights.
- deep setting

## Installing

clone the repo, and execute ``setup.sh`` script (you can check it, and узнать what exactly do this script),
and answear some questions (path to install, requirement root, etc.).

The script will install the package manager to the path, which you specified earlier, create neccessery directories, and
files of configuration.

You can install the package manager only for your user (default paths): 
- binaries will be in ~/.local/bin/;
- configuration in ~/.config/pi;
- files of packages in ~/.var/pi.
Or you can install it system-wide (require sudo/doas/su):
- binaries will be in /sbin/;
- confiuration in /etc/pi;
- files of packages in /var/pi.

## Usage

get the sources of your program then
```sh
cd <program>
pi
```

It executes ``./configure`` with --prefix=/tmp/\<program\>, make -j$(nproc), make install, creates file \<var\>/pi/\<package\>
which contains: size of program by executing ``du -sh <program>``, and ``/tmp/<program>``. And install the program

if required to manually set options then do:
```sh
./configure --prefix=/usr/local <your custom options>
# or if it is using meson
meson setup build -Dprefix=/usr/local -D<your options>
# then 
pi --no-configure 
# or
pi -n 
```
you can remove packages by:
```sh 
pi --remove 
# or 
pi -r
``` 

you can create binary tarballs for sharing
```sh 
tar -cf  /tmp/\<program\>.tar /tmp/pi/\<program\>/*
gzip -9 /tmp/\<program\>.tar
```
then will not create file in \<var\>, and will create /tmp/\<package\>.tar.gz

and for installing binaries by command
```sh
pi --install-pkg \<package\>.tar.gz
# or 
pi -I \<package\>.tar.gz
```

You can check all options of pi by typing
```sh 
pi --help
# or 
pi -h
```

## Removing

to remove pi, you need just run
``setup.sh --remove-pi`` 

## Strict No LLM / No AI Policy

No LLMs for issues.

No LLMs for patches / pull requests.

No LLMs for comments on the bug tracker, including translation.

English is encouraged, but not required. You are welcome to post in your native language and rely on others to have their own translation tools of choice to interpret your words.
