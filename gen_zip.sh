#!/bin/bash
MOD_VER=$(grep \"version info.json | cut -d'"' -f4)
(
	cd .. \
	&& rm -f MiniRoboports_${MOD_VER}.zip \
	&& zip -r MiniRoboports_${MOD_VER}.zip \
		MiniRoboports/thumbnail.png \
		MiniRoboports/data.lua \
		MiniRoboports/info.json \
		MiniRoboports/locale \
		MiniRoboports/graphics \
		MiniRoboports/prototypes \
		-x '*.xcf'
)
