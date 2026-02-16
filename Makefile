.PHONY: help setup install run lint clean export

PYTHON=python
NOTEBOOK=notebooks/01_analyze_runs.ipynb

help:
	@echo "Available commands:"
	@echo "  make setup     -> Create virtual environment with uv"
	@echo "  make install   -> Install dependencies"
	@echo "  make run       -> Run analysis notebook"
	@echo "  make export    -> Export notebook to HTML report"
	@echo "  make clean     -> Remove build artifacts"

setup:
	uv venv

install:
	uv pip install .

run:
	jupyter nbconvert --to notebook --execute $(NOTEBOOK) --inplace

export:
	jupyter nbconvert --to html --execute $(NOTEBOOK)

clean:
	rm -rf .venv
	rm -rf notebooks/*.html
