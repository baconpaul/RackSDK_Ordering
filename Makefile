RACK_DIR ?= ../..
include $(RACK_DIR)/arch.mk

# FLAGS will be passed to both the C and C++ compiler
FLAGS += -DRELEASE=1 
CFLAGS +=
LDFLAGS +=

SOURCES += $(wildcard src/*.cpp)


ifdef ARCH_LIN
FLAGS += -std=c++17 -fvisibility=hidden -fvisibility-inlines-hidden -Wno-unused-value -Wno-suggest-override -Wno-implicit-fallthrough -Wno-ignored-qualifiers
LDFLAGS += -pthread
endif

# Include the VCV plugin Makefile framework
include $(RACK_DIR)/plugin.mk
CXXFLAGS := $(filter-out -std=c++11,$(CXXFLAGS))


ifdef ARCH_LIN
	FLAGS += -DLINUX
        FLAGS += -Wno-nonnull-compare \
        -Wno-sign-compare \
        -Wno-char-subscripts \
        -Wno-unused-variable \
        -Wno-unused-but-set-variable \
        -Wno-reorder \
        -Wno-multichar
endif
