#/usr/bin/bash
alreadyInstalled=false
installation=false
uninstallation=false
PREFIX=/
packages=()



function checkAlreadyInstalled() {
  if [[ -f $PREFIX/etc/apt/sources.list.d/openaia.list ]]; then
    alreadyInstalled=true
  else
    alreadyInstalled=false
  fi
}

function installRepository() {
  if [[ ! -d $PREFIX/etc/apt/sources.list.d ]]; then
    mkdir -p $PREFIX/etc/apt/sources.list.d
  fi
  echo "deb [trusted=yes] https://openaia.github.io/bullseye/ bullseye main" >$PREFIX/etc/apt/sources.list.d/openaia.list
  rm -rf public.key >/dev/null 2>&1
  wget -q https://raw.githubusercontent.com/openaia/bullseye/main/public.key
  apt-key add public.key
  cp -r $PREFIX/etc/apt/trusted.gpg $PREFIX/etc/apt/trusted.gpg.d/openaia.gpg
  printf "Installation successful\n"
}
function removeRepository() {
  rm -rf $PREFIX/etc/apt/sources.list.d/openaia.list >/dev/null 2>&1
  printf "Removing successful!\n"
}

installRepository

sudo apt update

