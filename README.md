# Pkgbulids

此处存放了个人编写/修改的部分 Arch Liunx PKGBUILD，以方便对他们统一管理。

## 预编译软件源

如果需要预编译的软件包，本仓库提供预编译软件源（仅包含部分软件包），添加方法如下：

1. 导入我的 pgp 密钥至 pacman 可信密钥链，并在本地信任此密钥。

    ```sh
    pacman-key --recv-keys 0x9669DF042554F536
    pacman-key --lsing-key 0x9669DF042554F536
    ```

2. 在 pacman.conf 中添加软件源。

    ```conf
    [marisa]
    Server = https://repo.puqns67.icu/$arch
    ```

3. 同步软件源缓存。

    ```sh
    pacman -Syu
    ```

    * 虽然此处应该使用 Sy 来同步缓存，但是推荐使用 Syu 以在更新缓存时对整个系统进行更新，以避免出现异常情况（如找不到链接的共享库）。

## 相关连接

* [AUR 帐户](https://aur.archlinux.org/account/Puqns67)
* [软件源](https://repo.puqns67.icu/)
