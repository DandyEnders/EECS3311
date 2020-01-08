INCLUDE_PATH =  -I"$(ISE_LIBRARY)/library/time/spec/include"
SHELL = /bin/sh
CC = gcc
CPP = g++
CFLAGS = -O0 -pipe -fPIC -D_GNU_SOURCE -m64 -DEIF_THREADS -DEIF_LINUXTHREADS  -DWORKBENCH -I"/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/include" -I. $(INCLUDE_PATH)
CPPFLAGS = -O0 -pipe -fPIC -D_GNU_SOURCE -m64 -DEIF_THREADS -DEIF_LINUXTHREADS  -DWORKBENCH -I"/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/include" -I. $(INCLUDE_PATH)
LDFLAGS = -m elf_x86_64
CCLDFLAGS = -m64  
LDSHAREDFLAGS =  -m elf_x86_64 -shared -o
EIFLIB = "/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/lib/libmtwkbench.a"
EIFTEMPLATES = /cs/local/packages/Eiffel19.05/studio/config/linux-x86-64/templates
LIBS = -lm -lpthread
MAKE = make
AR = ar
LD = ld
MKDEP = \$(EIFFEL_SRC)/C/mkdep $(DPFLAGS) --
MV = /bin/mv
CP = /bin/cp
RANLIB = :
RM = /bin/rm -f
FILE_EXIST = 
RMDIR = 
X2C = "/cs/local/packages/Eiffel19.05/studio/spec/linux-x86-64/bin/x2c"
SHAREDLINK = ld
SHAREDLIBS = -lm
SHARED_SUFFIX = .so
COMMAND_MAKEFILE = 
START_TEST = if [ ! -f finished ] ; then 
END_TEST = ; fi 
CREATE_TEST = touch finished 
SYSTEM_IN_DYNAMIC_LIB = snooker.so 

.SUFFIXES:.cpp .o

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C5_c.o 

OLDOBJECTS =  ds1120.o ds1120d.o kl1111.o kl1111d.o kl1116.o kl1116d.o kl1104.o \
	kl1104d.o kl1114.o kl1114d.o kl1115.o kl1115d.o kl1118.o kl1118d.o \
	kl1110.o kl1110d.o kl1113.o kl1113d.o kl1112.o kl1112d.o kl1117.o \
	kl1117d.o ds1106.o ds1106d.o kl1105.o kl1105d.o ds1102.o ds1102d.o \
	in1107.o in1107d.o ds1103.o ds1103d.o ds1093.o ds1093d.o ki1119.o \
	ki1119d.o ds1091.o ds1091d.o ds1094.o ds1094d.o ds1098.o ds1098d.o \
	kl1108.o kl1108d.o ds1099.o ds1099d.o ds1097.o ds1097d.o ds1092.o \
	ds1092d.o ds1101.o ds1101d.o ds1095.o ds1095d.o ds1100.o ds1100d.o \
	kl1109.o kl1109d.o kl1096.o kl1096d.o 

all: Cobj5.o

Cobj5.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj5.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

