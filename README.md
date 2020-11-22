# whatprovides
yum --whatprovides utility for termux.

* whatprovides can list files of any termux official packages, doesn't matter that package is installed or not, it uses own database to perform task.

* It can be used as reverse search, means provide full path of any file it will give you output of that pkg.


### Installation:

```
pkg install whatprovides
```

### Manual Installation:

```
pkg install git gawk gzip make sqlite
git clone https://github.com/termux/whatprovides
cd whatprovides
make install
```

### Usage:

* List files of any package. For eg. aapt

```sh
$ whatprovides -p aapt
aapt: /data/data/com.termux/files/usr/bin/aapt
aapt: /data/data/com.termux/files/usr/bin/zipalign
aapt: /data/data/com.termux/files/usr/lib/libandroid-base.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-cutils.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-fw.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-utils.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-ziparchive.so
aapt: /data/data/com.termux/files/usr/share/aapt/android.jar
aapt: /data/data/com.termux/files/usr/share/doc/aapt/LICENSE
```

* search for files. Have you ever used `dpkg -S filepath`. 
Here you need to use like `whatprovides filepath`. 
You can search for any files which even not exist in your termux.
it will show you which package provide that file.
```sh
$ whatprovides $PREFIX/share/aapt
aapt: /data/data/com.termux/files/usr/share/aapt
```
