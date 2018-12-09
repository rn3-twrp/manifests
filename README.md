# TWRP manifests for Redmi Note 3 Sanpdragon
How To Build
```
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-8.1
mkdir -p .repo/local_manifests
wget -O .repo/local_manifests/recovery.xml https://raw.githubusercontent.com/rn3-twrp/manifests/master/recovery.xml
repo sync -c --no-tags --no-clone-bundle --force-sync -j4
wget https://raw.githubusercontent.com/rn3-twrp/manifests/master/twrp-build.sh
chmod a+x twrp-build.sh
./twrp-build.sh
```
