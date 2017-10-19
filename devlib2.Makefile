
include ${REQUIRE_TOOLS}/driver.makefile


COMMON:= common


ifeq ($(EPICS_VERSION)$(EPICS_REVISION)$(EPICS_MODIFICATION),3150)
# The MMIO definitions are included in EPICS Base >=3.15.1
HEADERS += $(COMMON)/os/default/epicsMMIO.h
HEADERS += $(COMMON)/epicsMMIODef.h
endif

ifeq ($(EPICS_VERSION)$(EPICS_REVISION),314)
HEADERS += $(COMMON)/os/default/epicsMMIO.h
HEADERS += $(COMMON)/os/default/epicsMMIODef.h

ifneq ($(findstring $(EPICS_MODIFICATION),1 2 3 4 5 6 7 8),)
HEADERS += $(COMMON)/epicsEndian.h
HEADERS += $(COMMON)/os/default/osdWireConfig.h
endif
endif



PCIAPP:= pciApp

HEADERS += $(PCIAPP)/devLibPCI.h
HEADERS += $(PCIAPP)/devLibPCIImpl.h

SOURCES += $(PCIAPP)/devLibPCI.c
SOURCES += $(PCIAPP)/devLibPCIStrings.c
SOURCES += $(PCIAPP)/os/Linux/devLibPCIOSD.c
SOURCES += $(PCIAPP)/pcish.c

DBDS += $(PCIAPP)/epicspci.dbd


VMEAPP:= vmeApp

HEADERS += $(VMEAPP)/devcsr.h
HEADERS += $(VMEAPP)/vmedefs.h

SOURCES += $(VMEAPP)/devcsr.c
SOURCES += $(VMEAPP)/iocreg.c
SOURCES += $(VMEAPP)/vmesh.c
SOURCES += $(VMEAPP)/devlib_compat.c

DBDS += $(VMEAPP)/epicsvme.dbd


