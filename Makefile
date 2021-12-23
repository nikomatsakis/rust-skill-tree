rvd.dot: rvd.toml
	skill-tree $< $@

.PHONY: setup
setup:
	cargo install skill-tree
