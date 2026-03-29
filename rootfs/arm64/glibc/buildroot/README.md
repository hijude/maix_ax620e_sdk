# README

## 安装依赖

```shell
apt install sed make binutils build-essential diffutils gcc g++ patch gzip bzip2 perl tar cpio unzip rsync bc findutils wget
apt install libncurses5-dev
apt install git curl sftp
```

## 编译

```shell
cd buildroot-2025.11
make sipeed_maix_nanokvm_defconfig
make
```

生成的镜像在`output/images`下

