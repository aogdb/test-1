
all : config.h
	cat config.h

config.h : ../.config
	cat ../.config | ../tools/build-config > $@

clean :
	rm -f config.h

