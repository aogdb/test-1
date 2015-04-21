
include ../.config

objs=main.o

# Objs config options

ifdef CONFIG_FIRE_IS_RIEMANN
	objs+=fire_riemann.o
endif
ifdef CONFIG_FIRE_IS_FIXED_PULSE
        objs+=fire_fixed.o
endif

ifdef CONFIG_SWITCH_IS_FIRE
	objs+=switchs_one.o
endif
ifdef CONFIG_SWITCHS_IS_FIRE_UP_DOWN
	objs+=switchs_three.o
endif

ifdef CONFIG_DISPLAY_IS_NONE
        objs+=display_none.o
endif
ifdef CONFIG_DISPLAY_IS_ONE_BASIC_LED
        objs+=display_led.o
endif

ifdef CONFIG_MENU_IS_NONE
	objs+=menu_none.o
endif
ifdef CONFIG_MENU_IS_BASIC
	objs+=menu_basic.o
endif

all : config.h main
	@echo "main ready to upload !"

include Makefile.depends

main : $(objs)
	$(CC) -o $@ $^

config.h : ../.config
	echo $(objs) > .ldobjs
	cat ../.config | ../tools/build-config > $@
	../tools/delete-obsoletes-files $(PWD)
	cp ../.config .config.current

depends :
	[ ! -e Makefile.depends ] && touch Makefile.depends || :
	makedepend -Y -fMakefile.depends -- $(CFLAGS) -- *.c*
	sed -i -re 's/config.h//' Makefile.depends 

clean :
	rm -f config.h *.o main

