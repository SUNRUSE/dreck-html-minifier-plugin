./plugins/html-minifier/npm-install-marker: ./plugins/html-minifier/package.json ./plugins/html-minifier/package-lock.json
	npm ci --prefix ./plugins/html-minifier
	touch $@

./plugins/html-minifier/generated/%.html: ./%.html ./plugins/html-minifier/npm-install-marker
	mkdir -p $(dir $@)
	cd ./plugins/html-minifier && cat ../../$< | npx html-minifier --collapse-boolean-attributes --collapse-inline-tag-whitespace --collapse-whitespace --decode-entities --minify-urls --remove-attribute-quotes --remove-comments --remove-empty-attributes --remove-empty-elements --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-style-link-type-attributes --remove-tag-whitespace --sort-attributes --sort-class-name --use-short-doctype > ../../$@
