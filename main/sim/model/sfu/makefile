#this file is needed to copy to the every subdirectory before to use

#define the openssl include path
IDIR = ./

CC = gcc
CFLAGS = -I$(IDIR)  -L./

LIBS = -lsoftfloat

#SOPATH = -Wl,-rpath=$(SSLLDIR)
SOPATH = 
#define the executable filename
TARGET = sfu_model.so

#the .h files that some source file rely on
#DEPS = 

#the .o file needed to generate
OBJ = sfu_model.o

$(TARGET):$(OBJ)
	$(CC) -pipe -fPIC -shared -o $@ $^ $(CFLAGS) $(LIBS) $(SOPATH)

%.o:%.c
	$(CC) -fPIC -c -o $@ $< $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f *.o *.exe *.so


