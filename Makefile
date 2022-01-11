SKILL_TREES=$(wildcard skill-trees/*.toml)
INCLUDE_SKILL_TREES=$(wildcard skill-trees/include/*.toml)
SKILL_TREE_SVGS=$(patsubst %.toml,%.svg,${SKILL_TREES})

.PHONY: build clean
build: ${SKILL_TREE_SVGS}
	cp ${SKILL_TREE_SVGS} src
	mdbook build

clean:
	rm src/*.svg ${SKILL_TREE_SVGS}

%.svg: %.dot
	dot -T svg $< > $@

%.dot: %.toml $(INCLUDE_SKILL_TREES)
	skill-tree $< $@

