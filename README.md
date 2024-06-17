# steps to install and use

run the shell script to install any application present in the repo like:

```
sudo addRepo.sh 
```
you can get the shell script like:

```
wget https://raw.githubusercontent.com/openaia/bullseye/main/addRepo.sh
before running the script we need to set the priority this is optinal if you want to prefer this repo packages over others.
=======
```


```bash
sudo vi /etc/apt/preferences.d/openaia.pref
```

then add


```
Package: *
Pin: origin "openaia.github.io"
Pin-Priority: 700
```


then update using

```
sudo apt update
```
to check install a available..
```
sudo apt install blueman
```
