#!/usr/bin/bash

export OSU_EXTERNAL_UPDATE_PROVIDER=true
export OSU_SDL3=${OSU_SDL3:=true}

if command -v gamemoderun &> /dev/null; then
    exec $(command -v gamemoderun) /usr/lib/osu/osu! "$@"
fi

exec /usr/lib/osu/osu! "$@"
