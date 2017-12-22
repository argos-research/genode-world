LIBVREPREMOTE_PORT_DIR := $(call select_from_ports,libvrepremote)

INC_LIBVREPREMOTE := remoteApi include

INC_DIR += $(addprefix $(LIBVREPREMOTE_PORT_DIR)/src/lib/libvrepremote/programming/, $(INC_LIBVREPREMOTE))

# see libvrepremote.mk
CC_OPT += -DNON_MATLAB_PARSING -DMAX_EXT_API_CONNECTIONS=255 -D__linux
