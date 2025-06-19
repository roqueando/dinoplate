TARGET = app_name
BUILDDIR = build/debug

all: build run

run: $(BUILDDIR)/Makefile
	@cd $(BUILDDIR) && ./$(TARGET)

build: $(BUILDDIR)/Makefile
	@cmake --build build/debug

$(BUILDDIR)/Makefile:
	@cmake -DCMAKE_BUILD_TYPE=Debug -B build/debug

clean:
	@$(MAKE) -C $(BUILDDIR) clean
	@rm -rf $(BUILDDIR)

.PHONY: build clean
