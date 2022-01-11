SKILL_TREES=$(wildcard skill-trees/*.toml)
INCLUDE_SKILL_TREES=$(wildcard skill-trees/include/*.toml)
SKILL_TREE_DOTS=$(patsubst %.toml,%.dot,${SKILL_TREES})
SKILL_TREE_SVGS=$(patsubst %.toml,%.svg,${SKILL_TREES})

.PHONY: build clean
build: ${SKILL_TREE_SVGS}
	cp ${SKILL_TREE_SVGS} src
	mdbook build

clean:
	rm -f src/*.svg ${SKILL_TREE_SVGS} ${SKILL_TREE_DOTS}

serve: build
	cd docs && python3 -m http.server

%.svg: %.dot
	dot -T svg $< > $@

%.dot: %.toml $(INCLUDE_SKILL_TREES)
	skill-tree $< $@

