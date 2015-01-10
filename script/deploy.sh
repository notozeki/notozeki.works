#!/bin/bash

SRC="build/" # trailing slash is important!
DST="front.notozeki.org:/var/www/notozeki.works"

rsync -rtv --delete $SRC $DST
