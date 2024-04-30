#!/usr/bin/bash

disable() {
    msg2 'disable: %s' $1
    scripts/config --disable $1
}

enable() {
    msg2 'enable: %s' $1
    scripts/config --enable $1
}

module() {
    msg2 'module: %s' $1
    scripts/config --module $1
}

setStr() {
    msg2 'setStr: %s -> %s' $1 $2
    scripts/config --set-str $1 $2
}

disableAll() {
    for i in $*; do
        disable $i
    done
}

enableAll() {
    for i in $*; do
        enable $i
    done
}

moduleAll() {
    for i in $*; do
        module $i
    done
}

setConfig() {
    msg2 'setConfig: %s' $1
    cp -f "CONFIGS/xanmod/gcc/${1}" .config
}

setOptimization() {
    msg2 'setOptimization: %s' $1
    source "${srcdir}/choose-gcc-optimization.bash" $1
}
