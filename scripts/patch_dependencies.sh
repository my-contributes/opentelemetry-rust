#!/bin/bash

function patch_version() {
    local latest_version=$(cargo search --limit 1 $1 | head -1 | cut -d'"' -f2)
    echo "patching $1 from $latest_version to $2"
    cargo update -p $1:$latest_version --precise $2
}

patch_version url 2.5.2 #https://github.com/servo/rust-url/issues/992
patch_version native-tls 0.2.13 # 0.2.14 needs rustc v1.80
