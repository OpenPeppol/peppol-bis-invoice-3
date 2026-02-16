#!/bin/sh

if [ -d "/target/guide" ]; then
    mkdir -p /target/site

    for src in /target/guide/*; do
        [ -e "$src" ] || continue

        if mv "$src" /target/site/ 2>/dev/null; then
            continue
        fi

        name=$(basename "$src")
        dest="/target/site/$name"

        if [ -d "$src" ]; then
            if [ -e "$dest" ]; then
                echo "mv: can't rename '$src' to '$dest': File exists" >&2
                exit 1
            fi

            cp -a "$src" "$dest"
            rm -rf "$src"
        else
            mv "$src" /target/site/
        fi
    done

    rmdir /target/guide 2>/dev/null || true
fi
