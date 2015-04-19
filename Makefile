
KCONFIG=kconfig-frontends

all : .config
	(cd src; make)

conf : kconfig
	$(KCONFIG)/frontends/conf/conf configs/default

menuconfig : mconf

mconf : kconfig
	$(KCONFIG)/frontends/mconf/mconf configs/default

gconf : kconfig
	$(KCONFIG)/frontends/gconf/gconf configs/default

nconf : kconfig
	$(KCONFIG)/frontends/nconf/nconf configs/default

qconf : kconfig
	$(KCONFIG)/frontends/qconf/qconf configs/default

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

clean :
	(cd src && make clean)

dist-clean : clean
	rm -f .config .config.old
	rm -Rf $(KCONFIG)
