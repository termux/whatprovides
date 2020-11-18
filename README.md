# whatprovides.
It is a yum(whatprovides) for termux.

* whatprovides can list files of any termux official packages, doesn't matter that package is installed or not, it uses own database to perform task.


### Installation:
clone repository and execute install.sh
```
git clone https://github.com/kcubeterm/whatprovides
cd whatprovides
bash install.sh
echo "Copy this too."

```

### Usage:

* List files of any package. For eg. aapt

```sh
$ whatprovides -p aapt

aapt: /.                                                                    aapt: /data                                                                 aapt: /data/data                                                            aapt: /data/data/com.termux                                                 aapt: /data/data/com.termux/files                                           aapt: /data/data/com.termux/files/usr                                       aapt: /data/data/com.termux/files/usr/share                                 aapt: /data/data/com.termux/files/usr/share/aapt                            aapt: /data/data/com.termux/files/usr/share/aapt/android.jar                aapt: /data/data/com.termux/files/usr/share/doc
aapt: /data/data/com.termux/files/usr/share/doc/aapt                        aapt: /data/data/com.termux/files/usr/lib
aapt: /data/data/com.termux/files/usr/lib/libandroid-cutils.so              aapt: /data/data/com.termux/files/usr/lib/libandroid-ziparchive.so          aapt: /data/data/com.termux/files/usr/lib/libandroid-base.so                aapt: /data/data/com.termux/files/usr/lib/libandroid-fw.so
aapt: /data/data/com.termux/files/usr/lib/libandroid-utils.so               aapt: /data/data/com.termux/files/usr/bin
aapt: /data/data/com.termux/files/usr/bin/aapt                              aapt: /data/data/com.termux/files/usr/bin/zipalign                          aapt: /data/data/com.termux/files/usr/share/doc/aapt/LICENSE

```

* search for files. Have you ever used `dpkg -S filepath`. 
Here you need to use only `whatprovides filepath`. 
You can search for any files which even not exist in your termux.
it will show you Which package provide that file.
