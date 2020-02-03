#!/bin/sh

set -e

version=b1
outdir=../public
site=wbn-test.web.app

for dir in hello iframe redirect no-response-for-primary-url
do
    baseurl=https://$site/$dir/
    primaryurl=$baseurl

    if [ $dir = redirect ] ; then
        primaryurl=${baseurl}index.html
    fi
    if [ $dir = no-response-for-primary-url ] ; then
        primaryurl=${baseurl}primary.html
    fi

    gen-bundle -version $version \
               -primaryURL $primaryurl \
               -baseURL $baseurl \
               -dir $dir \
               -ignoreErrors \
               -o $outdir/$dir.wbn
done

go run variants.go
