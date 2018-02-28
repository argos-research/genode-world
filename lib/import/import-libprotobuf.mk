LIBPROTOBUF_PORT_DIR := $(call select_from_ports,libprotobuf)
INC_DIR += $(LIBPROTOBUF_PORT_DIR)/src/lib/libprotobuf/src

PROTOBUF_PROTOC := $(BUILD_BASE_DIR)/tool/protobuf/protoc

$(TARGET): $(subst proto,pb.cc,$(SRC_PROTO))

%.pb.cc: %.proto
	$(PROTOBUF_PROTOC) --cpp_out=$(PRG_DIR) -I $(PRG_DIR) $<
	$(eval SRC_CC += $@)
	@echo $(SRC_CC)

vpath $(subst proto,pb.cc,$(SRC_PROTO)) $(PRG_DIR)
