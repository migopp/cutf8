CC          = cc
D_FLAGS     = -Wall -Wextra -O0 -g -std=c99 -fsanitize=address,undefined
R_FLAGS     = -O3 -std=c99

TARGET_DIR  = target
DEBUG_DIR   = $(TARGET_DIR)/debug
RELEASE_DIR = $(TARGET_DIR)/release

SRC_DIR     = .
SRC_C       = $(wildcard $(SRC_DIR)/*.c)
DEBUG_O     = $(DEBUG_DIR)/cutf8.o
RELEASE_O   = $(RELEASE_DIR)/cutf8.o

all: debug release

debug: $(DEBUG_O)

release: $(RELEASE_O)

$(DEBUG_O): $(DEBUG_DIR)/%.o: $(SRC_C)
	@mkdir -p $(dir $@)
	$(CC) -c $(D_FLAGS) -o $@ $(SRC_DIR)/$*.c

$(RELEASE_O): $(RELEASE_DIR)/%.o: $(SRC_C)
	@mkdir -p $(dir $@)
	$(CC) -c $(R_FLAGS) -o $@ $(SRC_DIR)/$*.c

clean:
	rm -rf $(TARGET_DIR)

.PHONY: cutf8 debug release clean
