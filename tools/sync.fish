#!/usr/bin/fish

function sync
    if test 3 -gt (count {$argv})
        echo "sync:"
        echo "用法: sync [REPO] [PACKAGES] [PACKAGE]"
        echo "参数:"
        echo "    [REPO]     Arch Linux CN 仓库路径。"
        echo "    [PACKAGES] Packages 路径。"
        echo "    [PACKAGE]  要同步的软件包名。"
        return 1
    end

    set repo {$argv[1]}
    set packages {$argv[2]}
    set package {$argv[3]}

    if not test -d {$repo}
        echo "REPO 不存在：$repo"
        return 2
    end

    if not test -d {$packages}
        echo "PACKAGES 目录不存在：$packages"
        return 3
    end

    if not test -d {$repo}/{$package}
        echo "[$package] 在 REPO 中无法找到对应的 PACKAGE。"
        return 4
    end

    if not test -f {$repo}/{$package}/PKGBUILD
        echo "[$package] 在 REPO 中无法找到对应的 PKGBUILD。"
        return 5
    end

    if not test -d {$packages}/{$package}
        echo "[$package] 在 PACKAGES 中新建目录"
        mkdir {$packages}/{$package}
    end

    if test -f {$packages}/{$package}/PKGBUILD
        echo "[$package] 将会覆盖 PACKAGES 中的 PKGBUILD"
    end

    echo "[$package] $repo/$package/PKGBUILD -> $packages/$package/PKGBUILD"
    cp {$repo}/{$package}/PKGBUILD {$packages}/{$package}/PKGBUILD
end

function dosync
    if test 2 -gt (count {$argv})
        echo "dosync:"
        echo "用法: dosync [PATH] [PACKAGE]..."
        echo "参数:"
        echo "    [PATH]       Arch Linux CN 仓库路径。"
        echo "    [PACKAGE]... 要同步的软件包名列表。"
        return 1
    end

    set repo (realpath {$argv[1]})
    set packages (realpath packages)

    if not test -d {$repo}
        echo "未能找到 Arch Linux CN 仓库，指定的 '$repo' 不存在。"
        return 2
    end

    if not test -d {$packages}
        echo "未能找到 packages 目录！请保证当前目录下存在 packages 目录。"
        return 3
    end

    for package in {$argv[2..]}
        sync {$repo} {$packages} {$package}
    end
end

if test 2 -le (count {$argv})
    echo "使用参数 $argv 运行 dosync…"
    dosync {$argv}
end
