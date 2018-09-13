
include ${E3_REQUIRE_TOOLS}/driver.makefile



# *** ISSUES
# driver.makefile recursively read all include directories which were installed.
# The only way to exclude header files is....



iocStats_VERSION=
autosave_VERSION=
asyn_VERSION=
busy_VERSION=
modbus_VERSION=
ipmiComm_VERSION=
sequencer_VERSION=
sscan_VERSION=

std_VERSION=
ip_VERSION=
calc_VERSION=
pcre_VERSION=
stream_VERSION=
s7plc_VERSION=
recsync_VERSION=

#devlib2_VERSION=
mrfioc2_VERSION=

exprtk_VERSION=
motor_VERSION=
ecmc_VERSION=
ethercatmc_VERSION=
ecmctraining_VERSION=


keypress_VERSION=
sysfs_VERSION=
symbolname_VERSION=
memDisplay_VERSION=
regdev_VERSION=
i2cDev_VERSION=

tosca_VERSION=
tsclib_VERSION=
ifcdaqdrv2_VERSION=

## The main issue is nds3, it is mandatory to disable it
## 
nds3_VERSION=
nds3epics_VERSION=
ifc14edrv_VERSION=
ifcfastint_VERSION=


nds_VERSION=
loki_VERSION=
nds_VERSION=
sis8300drv_VERSION=
sis8300_VERSION=
sis8300llrfdrv_VERSION=
sis8300llrf_VERSION=


ADSupport_VERSION=
ADCore_VERSION=
ADSimDetector_VERSION=
ADAndor_VERSION=
ADAndor3_VERSION=
ADPointGrey_VERSION=
ADProsilica_VERSION=

amcpico8_VERSION=
adpico8_VERSION=
adsis8300_VERSION=
adsis8300bcm_VERSION=
adsis8300bpm_VERSION=
adsis8300fc_VERSION=




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



# db rule is the default in RULES_E3, so add the empty one

db:
