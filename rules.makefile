./submodules/plugins/html-minifier/npm-install-marker: ./submodules/plugins/html-minifier/package.json ./submodules/plugins/html-minifier/package-lock.json
	npm ci --prefix ./submodules/plugins/html-minifier
	touch $@

DRECK_HTML_MINIFIER_PERCENT = %

./ephemeral/dist/%.html: $$(patsubst ./$${DRECK_HTML_MINIFIER_PERCENT}.html, ./ephemeral/src/$${DRECK_HTML_MINIFIER_PERCENT}.html, $$(filter ${DRECK_SRC_PATHS}, $$(addprefix ./, $$(addsuffix .html, %)))) $$(patsubst ./$${DRECK_HTML_MINIFIER_PERCENT}.html, ./ephemeral/intermediate/$${DRECK_HTML_MINIFIER_PERCENT}.html, $$(filter ${DRECK_INTERMEDIATE_PATHS}, $$(addprefix ./, $$(addsuffix .html, %)))) ./submodules/plugins/html-minifier/npm-install-marker
	mkdir -p $(dir $@)
	cd ./submodules/plugins/html-minifier && cat ../../../$< | npx html-minifier --collapse-boolean-attributes --collapse-inline-tag-whitespace --collapse-whitespace --decode-entities --minify-urls --remove-attribute-quotes --remove-comments --remove-empty-attributes --remove-empty-elements --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-style-link-type-attributes --remove-tag-whitespace --sort-attributes --sort-class-name --use-short-doctype > ../../../$@
