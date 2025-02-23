tmin: time_logger time_interval
	g++ time_logging/tmin.cpp time_logging/time_logger.o time_logging/time_interval.o -o tmin

tmon: time_logger time_interval
	g++ time_logging/tmon.cpp time_logging/time_logger.o time_logging/time_interval.o -o tmon

tmout: time_logger time_interval
	g++ time_logging/tmout.cpp time_logging/time_logger.o time_logging/time_interval.o -o tmout

tmall: time_logger time_interval
	g++ time_logging/tmall.cpp time_logging/time_logger.o time_logging/time_interval.o -o tmall

time_logger: time_interval
	g++ -c time_logging/time_logger.cpp time_logging/time_interval.o -o time_logging/time_logger.o

time_interval:
	g++ -c time_logging/time_interval.cpp -o time_logging/time_interval.o

test: tmin tmon tmout tmall
	rm time_logging/*.o
	cp time_logging/tmoff ./
	cp tmux_scripts/mltsk_in ./
	cp tmux_scripts/mltsk_out ./

cleanup:
	rm ./tmin ./tmon ./tmout ./tmoff ./tmall ./mltsk_in ./mltsk_out

install: tmin tmon tmout tmall
	if [ ! -d "$(HOME)/.mltsk" ]; then mkdir $(HOME)/.mltsk ; fi
	mv tmin $(HOME)/.local/bin/
	mv tmon $(HOME)/.local/bin/
	mv tmout $(HOME)/.local/bin/
	mv tmall $(HOME)/.local/bin/
	cp time_logging/tmoff $(HOME)/.local/bin/
	cp tmux_scripts/mltsk_in $(HOME)/.local/bin/
	cp tmux_scripts/mltsk_out $(HOME)/.local/bin/
	rm time_logging/*.o
