all: local-service-account.zip

local-service-account.exe: main.c
	gcc -o $@ -std=gnu99 -pedantic -Os -Wall -m64 -municode main.c -lnetapi32 -ladvapi32 -luserenv
	strip $@

local-service-account.zip: local-service-account.exe
	zip -9 $@ $<

clean:
	rm -f local-service-account.exe local-service-account.zip

.PHONY: all clean
