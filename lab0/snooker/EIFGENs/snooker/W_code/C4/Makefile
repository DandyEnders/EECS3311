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

OBJECTS = big_file_C4_c.o 

OLDOBJECTS =  rx1064.o rx1064d.o rx1063.o rx1063d.o rx1062.o rx1062d.o ds1065.o \
	ds1065d.o ds1086.o ds1086d.o ds1072.o ds1072d.o ds1089.o ds1089d.o \
	kl1073.o kl1073d.o kl1084.o kl1084d.o ds1077.o ds1077d.o ds1066.o \
	ds1066d.o ds1080.o ds1080d.o kl1069.o kl1069d.o kl1083.o kl1083d.o \
	ds1070.o ds1070d.o ds1087.o ds1087d.o ds1071.o ds1071d.o ds1088.o \
	ds1088d.o kl1074.o kl1074d.o kl1085.o kl1085d.o ut1059.o ut1059d.o \
	kl1067.o kl1067d.o kl1081.o kl1081d.o ds1068.o ds1068d.o ds1082.o \
	ds1082d.o uc1060.o uc1060d.o ki1075.o ki1075d.o uc1061.o uc1061d.o \
	uc1058.o uc1058d.o ds1078.o ds1078d.o ds1079.o ds1079d.o ki1076.o \
	ki1076d.o ds1090.o ds1090d.o 

all: Cobj4.o

Cobj4.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj4.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

