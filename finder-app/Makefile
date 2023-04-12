CC = $(CROSS_COMPILE)gcc
TARGET = writer
SRC = writer.c
OBJ = $(SRC:.c=.o)

ifeq ($(CROSS_COMPILE),)
	# native build
	CFLAGS = -Wall -Wextra -pedantic
else
	# cross-compilation
	CFLAGS = --sysroot=/opt/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu- -Wall -Wextra -pedantic
endif

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET) $(OBJ)

