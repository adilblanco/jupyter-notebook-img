export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

help:
	$(info ____________________ help ____________________)
	$(info type `make start` to launch Jupyter notebook.)
	$(info type `make stop` to shutdown Jupyter notebook.)
	$(info *** add more help as needed ***)
	$(info ______________________________________________)

start:
	jupyter notebook --port=8888
	# jupyter notebook --port=8888 --no-browser

stop:
	jupyter notebook stop 8888