BASE="jupyterhub.thelio.carlboettiger.info"
## Makefile to build JupyterBook for this repository
## - html-hub: build static website so it can be viewed on hosted JupyterHub (via URL proxy).

.PHONY: html-hub
html-hub: html
	@echo
	@echo "To start the Python http server, use:"
	@echo "python -m http.server --directory ${PWD}/_build/html"
	@echo "and visit this link with your browser:"
	@echo "https://${BASE}${JUPYTERHUB_SERVICE_PREFIX}proxy/8000/index.html"

## - html    : Build static website for local display
.PHONY: html
html:
	jupyter-book build .

.PHONY: serve
serve: 
	python -m http.server --directory ${PWD}/_build/html


## - clean   : remove all build files
.PHONY: clean
clean:
	rm -rf _build/html/

## - help    : Summary help of all targets in this Makefile.
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
