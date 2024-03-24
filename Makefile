run:
	pipenv run uvicorn src.main:app --reload

tests:
	pipenv run pytest -v
