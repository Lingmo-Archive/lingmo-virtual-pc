#!/bin/sh

# Lingmo OS Boxes hasn't implemented a way to invalidate the cache
# so we do it manually once to get the new Ubuntu & Fedora logos
rm .cache/lingmo-virtual-pc/logos/*.svg
