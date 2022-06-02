./plugins/other-plugin/generated/input.html:
	mkdir -p $(dir $@)
	cp ./plugins/other-plugin/input.html $@

./plugins/other-plugin/generated/dreck_html_minifier_output_html_paths.txt:
	mkdir -p $(dir $@)
	echo $(DRECK_HTML_MINIFIER_OUTPUT_HTML_PATHS) > $@
