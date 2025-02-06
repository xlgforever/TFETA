#this file is needed to copy to the every subdirectory before to use

#define the openssl include path
IDIR = ./

THIRD_PARTY_DIR = ../Berkeley_softfloat/


CC = gcc
CFLAGS = -I$(IDIR)  -L./

LIBS = -L$(THIRD_PARTY_DIR)  -lsoftfloat

#SOPATH = -Wl,-rpath=$(SSLLDIR)
SOPATH = 
#define the executable filename
TARGET = systolic_arrayc_rtl.so

#the .h files that some source file rely on
#DEPS = 

#the .o file needed to generate
OBJ = systolic_arrayc_rtl.o

$(TARGET):$(OBJ)
	$(CC) -pipe -fPIC -shared -o $@ $^ $(CFLAGS) $(LIBS) $(SOPATH)

%.o:%.c
	$(CC) -fPIC -c -o $@ $< $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f *.o *.exe *.so


