TARGET=HelloWorld
OBJS=HelloWorld.o
CC=gcc
LD=gcc
CFLAGS= -g -c
LFLAGS= -lm -o

all : $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) $(LFLAGS) $(TARGET) $(OBJS)

.c.o:
	$(CC) $(CFLAGS) $<

clean:
	rm -rf $(OBJS)
	rm -rf $(TARGET)
