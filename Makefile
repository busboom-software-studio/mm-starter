.PHONY: all serve stop deps repos clean

all: deps repos 

deps:
	bundle install

repos:
	bin/get_repos.sh

serve:
	@if [ ! -f .jekyll.pid ]; then \
		bundle exec jekyll serve --incremental & echo $$! > .jekyll.pid; \
		echo "Jekyll server started"; \
	else \
		echo "Jekyll server already running"; \
	fi

stop:
	@if [ -f .jekyll.pid ]; then \
		kill `cat .jekyll.pid`; \
		rm .jekyll.pid; \
		echo "Jekyll server stopped"; \
	fi

clean:
	rm -f .jekyll.pid
	rm -rf _site .jekyll-cache