
include ${REQUIRE_TOOLS}/driver.makefile


PCIAPP:= pciApp

HEADERS += $(PCIAPP)/devLibPCI.h
HEADERS += $(PCIAPP)/devLibPCIImpl.h

SOURCES += $(wildcard $(PCIAPP)/devLib*.c)
SOURCES += $(PCIAPP)/pcish.c
SOURCES_Linux += $(PCIAPP)/os/Linux/devLibPCIOSD.c

DBDS += $(PCIAPP)/epicspci.dbd


VMEAPP:= vmeApp

HEADERS += $(VMEAPP)/devcsr.h
HEADERS += $(VMEAPP)/vmedefs.h

SOURCES += $(VMEAPP)/devcsr.c
SOURCES += $(VMEAPP)/iocreg.c
SOURCES += $(VMEAPP)/vmesh.c
SOURCES += $(VMEAPP)/devlib_compat.c

DBDS += $(VMEAPP)/epicsvme.dbd


