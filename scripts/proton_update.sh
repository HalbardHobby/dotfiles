#! /usr/bin/env sh

PROTON_PATH="~/.steam/root/compatibilitytools.d/"

cd PROTON_PATH

curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest \
| grep "browser_download_url*" \
| cut -d : -f 2,3 \
| wget -i - -O proton.tar.gz

tar -xvf proton.tar.gz

\rm proton.tar.gz

