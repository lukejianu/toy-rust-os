
.PHONY: all
all:
	scribble --dest build --htmls index.scrbl \
	&& mv build/index/* build && rm -rf build/index # Flatten.

.PHONY: open
open:
	open build/index.html

.PHONY: clean
clean:
	rm -rf build
