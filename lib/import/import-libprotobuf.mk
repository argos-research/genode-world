LIBPROTOBUF_PORT_DIR := $(call select_from_ports,libprotobuf)
INC_DIR += $(LIBPROTOBUF_PORT_DIR)/src/lib/libprotobuf/src

PROTOBUF_PROTOC := $(BUILD_BASE_DIR)/tool/protobuf/protoc

# replace *.proto by *.pb.cc and add files to SRC_CC
SRC_CC += $(notdir $(SRC_PROTO:.proto=.pb.cc))

# compile *.proto to *.pb.cc and *.pb.h
%.pb.cc:
	@echo "    GENERATE "$@
	$(eval PROTO_FILE := $(filter $(addprefix %,$(@:.pb.cc=.proto)),$(SRC_PROTO)))
	$(VERBOSE) if [[ $(PROTO_FILE) != /* ]]; \
	then    # relative path given \
		$(PROTOBUF_PROTOC) --cpp_out=./ $(addprefix -I$(PRG_DIR)/,$(dir $(SRC_PROTO))) $(PRG_DIR)/$(PROTO_FILE); \
	else    # absolute path given \
		$(PROTOBUF_PROTOC) --cpp_out=./ $(addprefix -I,$(dir $(SRC_PROTO))) $(PROTO_FILE); \
	fi;
