#!/usr/bin/bash

# MiaCode current not support running with Wayland
export QT_QPA_PLATFORM="xcb"

exec /usr/lib/miacode/MiaCode "$@"
