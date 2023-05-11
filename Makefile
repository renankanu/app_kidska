PHONY: help

help:
	@IFS=$$'\n' ; \
	commands=(`cat Makefile | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'`) ; \
	echo "Usage: make [command]" ; \
	echo "" ; \
	echo "Commands:" ; \
	for command in "$${commands[@]}" ; do \
		echo $$command ; \
	done ; \
	echo "" ; \

release: ## Release a flutter version
	@echo "\033[47m ⊢ Running flutter build appbundle ⊣ \033[0m"
	@flutter analyze
	@flutter build appbundle
	@open "build/app/outputs/bundle/release"
	@echo "Done ✅"



