#!/usr/bin/fish

function dosign
    if test 2 -gt (count {$argv})
        echo "dosign:"
        echo "用法: dosign [KEY] [FILES]..."
        echo "参数:"
        echo "    [KEY]      指定用于签名的密钥。"
        echo "    [FILES]... 要签名的目标文件。"
        return 1
    end

    for target in {$argv[2..]}
        echo "sign: $target"
        gpg --local-user {$argv[1]} --detach-sign {$target}
    end
end

if test 2 -le (count {$argv})
    echo "使用参数 $argv 运行 dosign…"
    dosign {$argv}
end
