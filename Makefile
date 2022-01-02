SKILL_TREES=$(wildcard skill-trees/*.toml)
SKILL_TREE_SVGS=$(patsubst %.toml,%.svg,${SKILL_TREES})

.PHONY: build
build: ${SKILL_TREE_SVGS}
	cp ${SKILL_TREE_SVGS} src
	mdbook build

%.svg: %.dot
	dot -T svg $< > $@

%.dot: %.toml
	skill-tree $< $@