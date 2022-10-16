#
# repos.mk - Setup repositories
#

.PHONY: repo_wiki
repo_wiki:		## Clone Wiki
	git clone git@github.com:imlzo/wiki.git $(HOME)/wiki
