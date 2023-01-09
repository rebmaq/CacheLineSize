all: main link

.PHONY: cache clean archive

CACHE := cache_line_size

archive: cache
	ar -rsc cache_line_size.a $(CACHE).o

main: cache
	gcc main.c -o main.o -c

cache: $(CACHE).c
	gcc $(CACHE).c -o $(CACHE).o -c

link:
	gcc -o cache main.o $(CACHE).o

clean:
	rm *.o