rvd.svg: rvd.dot
	dot -T svg rvd.dot > rvd.svg 

rvd.dot: rvd.toml
	skill-tree $< $@

.PHONY: setup
setup:
	cargo install skill-tree
