# ============================
# Main Build File
# ============================

include Make.M

SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c, tmp/%.o, $(SRC))

TARGET := bin/app

all: $(TARGET)

$(TARGET): $(OBJ)
	$(call link_bin)

tmp/%.o: src/%.c src/*.h
	$(call compile_c)

clean:
	$(call clean_all)
