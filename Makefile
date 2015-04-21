
KCONFIG=kconfig-frontends

all : .config
	(cd src; make)

conf : kconfig
	$(KCONFIG)/frontends/conf/conf configs/default

menuconfig : mconf

mconf : kconfig
	$(KCONFIG)/frontends/mconf/mconf configs/default
	(cd src; make config.h)

gconf : kconfig
	$(KCONFIG)/frontends/gconf/gconf configs/default
	(cd src; make config.h)

nconf : kconfig
	$(KCONFIG)/frontends/nconf/nconf configs/default
	(cd src; make config.h)

qconf : kconfig
	$(KCONFIG)/frontends/qconf/qconf configs/default
	(cd src; make config.h)

kconfig : $(KCONFIG)/frontends/mconf/mconf

$(KCONFIG)/frontends/mconf/mconf :
	if [ ! -d $(KCONFIG) ]; then \
		git clone https://github.com/jameswalmsley/kconfig-frontends.git; \
	fi
	
	( cd $(KCONFIG) && ./bootstrap && ./configure && make )
	

.config :
	@if [ ! -e .config ]; then \
		echo ".config file not found !" >&2; \
		echo >&2; \
		echo "Run \"make menuconfig\" first please !" >&2; \
		exit 1; \
	fi;

depends :
	(cd src && make depends)
clean :
	(cd src && make clean)

dist-clean : clean
	rm -f .config .config.old
	rm -Rf $(KCONFIG)
