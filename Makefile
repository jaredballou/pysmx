# Makefile for PySMX module

MODULE = pysmx
TEST_VERBOSITY = 2
TEST_DIR = test
TEST_COMMAND = "py.test"
#PYTHONHASHSEED=0 nosetests --verbosity $(TEST_VERBOSITY) --with-coverage --cover-package=$(MODULE)"

define HELPBODY
Available commands:

	make help       - this thing.
	make init       - install python dependancies
	make test       - run tests and coverage
	make pylint     - code analysis
	make build      - pylint + test

endef

export HELPBODY
help:
	@echo "$$HELPBODY"

init:
	pip install -r requirements.txt

test: clean
	$(TEST_COMMAND)

pylint:
	pylint -r n -f colorized $(MODULE) || true

build: pylint test

clean:
	rm -f .coverage $(MODULE)/*.pyc $(TEST_DIR)/*.pyc
	find . -type f -iname '*.pyc' -exec rm -v {} \;
	rm -rf dist $(MODULE).egg-info $(MODULE)/*.pyc

dist: clean
	python setup.py sdist
	python setup.py bdist_wheel --universal

register:
	python setup.py register -r pypi

upload: dist register
	twine upload -r pypi dist/*
