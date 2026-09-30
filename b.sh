#!/bin/bash
# b.sh — 一键编译 + 烧录（环境自带，不需要 idfenv）
# 用法：在 WSL 终端里  bash b.sh

. /root/esp/esp-idf/export.sh >/dev/null 2>&1
cd "$(dirname "$0")"

echo "=== 编译 ==="
idf.py build || { echo "!! 编译失败，看上面的报错"; exit 1; }

echo "=== 烧录（COM3，烧完自动重启）==="
cd build
/mnt/c/Users/37230/.workbuddy/binaries/python/versions/3.13.12/python.exe -m esptool --chip esp32 --port COM3 -b 460800 --before default_reset --after hard_reset write_flash @flash_args && echo "=== 完成！看板子上的 LED ==="
