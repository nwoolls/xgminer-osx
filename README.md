xgminer-osx
===========

This project consists of a standard set of shell scripts for creating redistributable packages of [cgminer][6] and [bfgminer][7] for Mac OS X.

![bfgminer](http://nwoolls.files.wordpress.com/2013/07/screen-shot-2013-07-01-at-5-47-22-pm.png "bfgminer")

The [Releases][8] page is used to provide binary downloads for these redistributable packages. All source code comes from official sources.

This project is a collaboration between:

* John - author of [MacMiner][5]
* [Kerry][3] - author of Asteroid
* [Nate Woolls][1] - author of [MultiMiner][2]

Our aim is to provide a single source for the best possible OS X binaries for cgminer and bfgminer until such time as the authors provide OS X redistributables themselves.

### Prerequisites

#### General

* automake
* autoconf
* libtool
* GNU sed
* git
* wget


#### BFGMiner

* openssl

Install with Homebrew - e.g. `brew install automake autoconf libtool gnu-sed git wget`


Homebrew
--------

If you are a [Homebrew][10] user and are interested in using Homebrew to install cgminer and/or bfgminer, the [homebrew-xgminer][9] repository contains formulas and instructions that make this a simple process.

[1]: http://www.nwoolls.com/
[2]: http://multiminerapp.com
[3]: http://www.spaceman.ca/blog/
[5]: http://macminer.fabulouspanda.com/
[6]: https://github.com/ckolivas/cgminer
[7]: https://github.com/luke-jr/bfgminer
[8]: https://github.com/nwoolls/xgminer-osx/releases
[9]: http://homebrew.xgminer.com
[10]: http://brew.sh/
