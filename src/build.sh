#!/bin/sh

set -e

outdir=../public
site=wbn-test.web.app

for dir in hello iframe
do
    url=https://$site/$dir/
    gen-bundle -version b1 -primaryURL $url -baseURL $url -dir $dir -o $outdir/$dir.wbn
done

go run variants.go
