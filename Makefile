skill-trees/main.svg: skill-trees/main.dot
	dot -T svg skill-trees/main.dot > skill-trees/main.svg 

skill-trees/main.dot: skill-trees/main.toml ${HOME}/.cargo/bin/skill-tree
	${HOME}/.cargo/bin/skill-tree $< $@

${HOME}/.cargo/bin/skill-tree:
	cargo install skill-tree
