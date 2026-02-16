.PHONY: help setup install run export clean

NOTEBOOK=notebooks/01_analyze_runs.ipynb

help:
	@echo "Available commands:"
	@echo "  make setup   -> Create virtual environment with uv"
	@echo "  make install -> Install dependencies"
	@echo "  make run     -> Execute analysis notebook in-place"
	@echo "  make export  -> Export notebook to HTML report"
	@echo "  make clean   -> Remove virtual environment and reports"

setup:
	uv venv --clear

install:
	uv pip install -r pyproject.toml

run:
	jupyter nbconvert --to notebook --execute $(NOTEBOOK) --inplace

export:
	jupyter nbconvert --to html --execute $(NOTEBOOK) --output notebooks/01_analyze_runs.html

clean:
	rm -rf .venv
	rm -rf notebooks/*.html
