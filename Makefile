BASE="jupyterhub.cirrus.carlboettiger.info"
## Makefile to build JupyterBook for this repository

## - html    : Build static website for local display
.PHONY: html
html:
	BASE_URL="/user/${JUPYTERHUB_USER}/proxy/8000" myst build --html

.PHONY: serve
serve: 
	@echo "preview at: https://${BASE}${JUPYTERHUB_SERVICE_PREFIX}proxy/8000/index.html"
	npx serve -p 8000 _build/html 2>/dev/null


.PHONY: install
install:
	pip install -r book-requirements.txt

## - clean   : remove all build files
.PHONY: clean
clean:
	rm -rf _build/html/

## - help    : Summary help of all targets in this Makefile.
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
