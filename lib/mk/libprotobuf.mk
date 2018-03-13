protobuf_source_dir := $(call select_from_ports,libprotobuf)/src/lib/libprotobuf

libprotobuf_files = ${protobuf_source_dir}/src/google/protobuf/any.cc \
  ${protobuf_source_dir}/src/google/protobuf/any.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/api.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/compiler/importer.cc \
  ${protobuf_source_dir}/src/google/protobuf/compiler/parser.cc \
  ${protobuf_source_dir}/src/google/protobuf/descriptor.cc \
  ${protobuf_source_dir}/src/google/protobuf/descriptor.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/descriptor_database.cc \
  ${protobuf_source_dir}/src/google/protobuf/duration.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/dynamic_message.cc \
  ${protobuf_source_dir}/src/google/protobuf/empty.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/extension_set_heavy.cc \
  ${protobuf_source_dir}/src/google/protobuf/field_mask.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/generated_message_reflection.cc \
  ${protobuf_source_dir}/src/google/protobuf/generated_message_table_driven.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/gzip_stream.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/printer.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/strtod.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/tokenizer.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/zero_copy_stream_impl.cc \
  ${protobuf_source_dir}/src/google/protobuf/map_field.cc \
  ${protobuf_source_dir}/src/google/protobuf/message.cc \
  ${protobuf_source_dir}/src/google/protobuf/reflection_ops.cc \
  ${protobuf_source_dir}/src/google/protobuf/service.cc \
  ${protobuf_source_dir}/src/google/protobuf/source_context.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/struct.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/mathlimits.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/substitute.cc \
  ${protobuf_source_dir}/src/google/protobuf/text_format.cc \
  ${protobuf_source_dir}/src/google/protobuf/timestamp.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/type.pb.cc \
  ${protobuf_source_dir}/src/google/protobuf/unknown_field_set.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/delimited_message_util.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/field_comparator.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/field_mask_util.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/datapiece.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/default_value_objectwriter.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/error_listener.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/field_mask_utility.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/json_escaping.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/json_objectwriter.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/json_stream_parser.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/object_writer.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/proto_writer.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/protostream_objectsource.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/protostream_objectwriter.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/type_info.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/type_info_test_helper.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/internal/utility.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/json_util.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/message_differencer.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/time_util.cc \
  ${protobuf_source_dir}/src/google/protobuf/util/type_resolver_util.cc \
  ${protobuf_source_dir}/src/google/protobuf/wire_format.cc \
  ${protobuf_source_dir}/src/google/protobuf/wrappers.pb.cc

libprotobuf_lite_files = ${protobuf_source_dir}/src/google/protobuf/arena.cc \
  ${protobuf_source_dir}/src/google/protobuf/arenastring.cc \
  ${protobuf_source_dir}/src/google/protobuf/extension_set.cc \
  ${protobuf_source_dir}/src/google/protobuf/generated_message_table_driven_lite.cc \
  ${protobuf_source_dir}/src/google/protobuf/generated_message_util.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/coded_stream.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/zero_copy_stream.cc \
  ${protobuf_source_dir}/src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
  ${protobuf_source_dir}/src/google/protobuf/message_lite.cc \
  ${protobuf_source_dir}/src/google/protobuf/repeated_field.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/atomicops_internals_x86_msvc.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/bytestream.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/common.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/int128.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/io_win32.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/once.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/status.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/statusor.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/stringpiece.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/stringprintf.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/structurally_valid.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/strutil.cc \
  ${protobuf_source_dir}/src/google/protobuf/stubs/time.cc \
  ${protobuf_source_dir}/src/google/protobuf/wire_format_lite.cc

SRC_CC = $(libprotobuf_lite_files) $(libprotobuf_files)

INC_DIR += $(protobuf_source_dir)/src

LIBS += stdcxx pthread zlib protobuf_host_tools

# disable TLS (thread local storage)
CXX_DEF += -DHAVE_PTHREAD -DHAVE_ZLIB -DGOOGLE_PROTOBUF_NO_THREADLOCAL

CC_WARN = -Wno-sign-compare

SHARED_LIB = yes
