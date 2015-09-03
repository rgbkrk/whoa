PROG = whoa
CFLAGS = -W -Wall -static -pthread -g -O0 $(CFLAGS_EXTRA)
SOURCES = $(PROG).c mongoose.c

default: images

images:
	docker build -t bintin -f Dockerfile.build .
	docker run bintin > whoa
	chmod u+x whoa
	docker build -t whoa/tiny .

cycle: images
	-docker rm -fv whoa
	docker run -d --name whoa -it -p 80:8080 whoa/tiny
	curl $(DOCKER_IP)


$(PROG): $(SOURCES) Makefile
	$(CC) -o $(PROG) $(SOURCES) $(CFLAGS)

clean:
	rm -rf $(PROG) *.exe *.dSYM *.obj *.exp .*o *.lib *.gc*
