LIBVREPREMOTE_SRC_DIR := $(call select_from_ports,libvrepremote)/src/lib/libvrepremote

# list of source files and include paths
SRC_LIBVREPREMOTE := extApi.c extApiPlatform.c
INC_LIBVREPREMOTE := remoteApi include

# set SRC_CC and INC_DIR
SRC_CC = $(addprefix $(LIBVREPREMOTE_SRC_DIR)/programming/remoteApi/, $(SRC_LIBVREPREMOTE))
INC_DIR += $(addprefix $(LIBVREPREMOTE_SRC_DIR)/programming/, $(INC_LIBVREPREMOTE))

# see [1] for the first two defines
# __linux needs to be set for some in code define statements
CC_OPT = -DNON_MATLAB_PARSING -DMAX_EXT_API_CONNECTIONS=255 -D__linux

# get rid of uninteresting warnings
CC_OPT += -Wno-unused-but-set-variable -Wno-maybe-uninitialized

# stdcxx is needed for some includes
LIBS += stdcxx

# [1] http://www.coppeliarobotics.com/helpFiles/en/remoteApiClientSide.htm
