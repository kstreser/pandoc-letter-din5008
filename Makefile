ARCHIVE_FILE=`awk '/^to:/{getline; print}' $< | sed -e 's/^[[:space:]]*//g' -e 's/[[:space:]]*$$//g' | tr ' ' '-'`_`awk '/subject:/{print $$2}' $<`_`date +%F`

output.pdf: *.md
	vim $<
	pandoc $< -o $@ --template=letter && evince $@
	@cp $< ./archive/$(ARCHIVE_FILE).md
	@echo "Copied $< to ./archive/$(ARCHIVE_FILE).md"
	@rm $@
