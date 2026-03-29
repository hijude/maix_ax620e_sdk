# Forward all make targets to the real Buildroot tree.
BUILDROOT_DIR := $(CURDIR)/buildroot-2025.11

.PHONY: all
all:
	$(MAKE) -C $(BUILDROOT_DIR)

%:
	$(MAKE) -C $(BUILDROOT_DIR) $@