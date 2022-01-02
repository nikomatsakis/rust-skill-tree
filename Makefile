skill-trees/rvd.svg: skill-trees/rvd.dot
	dot -T svg skill-trees/rvd.dot > skill-trees/rvd.svg 

skill-trees/rvd.dot: skill-trees/rvd.toml ${HOME}/.cargo/bin/skill-tree
	${HOME}/.cargo/bin/skill-tree $< $@

${HOME}/.cargo/bin/skill-tree:
	cargo install skill-tree
