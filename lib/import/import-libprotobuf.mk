LIBPROTOBUF_PORT_DIR := $(call select_from_ports,libprotobuf)
INC_DIR += $(LIBPROTOBUF_PORT_DIR)/src/lib/libprotobuf/src

PROTOBUF_PROTOC := $(BUILD_BASE_DIR)/tool/protobuf/protoc

# replace *.proto by *.pb.cc
SRC_CC += $(subst proto,pb.cc,$(SRC_PROTO))

# compile *.proto to *.pb.cc and *.pb.h
%.pb.cc: %.proto
	$(VERBOSE)$(PROTOBUF_PROTOC) --cpp_out=. -I $(PRG_DIR) $<
