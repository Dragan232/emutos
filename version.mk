#
# version.mk - Makefile fragment for version numbers
#
# Copyright (C) 2017-2019 The EmuTOS development team.
#
# Authors:
#  VRI      Vincent Rivière
#
# This file is distributed under the GPL, version 2 or at your
# option any later version.  See doc/license.txt for details.
#

#
# EmuTOS and EmuCON2 version management
#

#
# the following values are stored in the EmuTOS 'extended os header',
# and are used to create the VERSION string for official releases.
#
MAJOR_VERSION = 0
MINOR_VERSION = 9
FIX_VERSION = 12

empty =
space = $(empty) $(empty)
ifeq ($(FIX_VERSION),0)
tempversion = $(MAJOR_VERSION) $(MINOR_VERSION)
else
tempversion = $(MAJOR_VERSION) $(MINOR_VERSION) $(FIX_VERSION)
endif

#
# this is the version string displayed on the welcome screen, and in
# EmuDesk's 'About' dialog.  in binaries generated by Travis, it is
# overridden by a string containing date and commit id.
#
#VERSION = $(subst $(space),.,$(tempversion))
VERSION = $(shell date +%Y%m%d)

#
# this is stored in the EmuTOS 'extended os header'.  a zero value
# indicates an official release; a non-zero value indicates a snapshot.
#
ifeq ($(findstring .,$(VERSION)),.)
SNAPSHOT = 0
else
SNAPSHOT = 1
endif
