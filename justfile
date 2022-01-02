build:
    #!/usr/bin/env sh
    cd skill-trees
    for tree in *.toml; do
        skill-tree ${tree} /dev/stdout | dot -T svg > ../src/${tree}.svg
    done

install:
    cargo install skill-tree