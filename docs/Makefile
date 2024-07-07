# NOTE: You must also have pygmentize installed and in your PATH.
.PHONY: install
install:
	raco pkg install --auto --skip-installed scribble-minted

.PHONY: docs
docs:
	scribble --dest build --htmls index.scrbl \
	&& mv build/index/* build && rm -rf build/index # Flatten.

.PHONY: open
open:
	open build/index.html

.PHONY: clean
clean:
	rm -rf build
