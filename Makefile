testdata:
	python3.7 -m pytest ./tests/test_praw.py

flashlaunch:
export FLASK_APP=simplefront.py
python -m flask run

testmake:
	echo "If it bleeds, it means we can kill it."
