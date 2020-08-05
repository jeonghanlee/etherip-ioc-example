#! ../../epics-7.0.4/epics-modules/ether_ip/bin/linux-x86/eipIoc
# 3.14 example startup file for a Host  -*- shell-script -*-


epicsEnvSet("MOD_TOP", "${EPICS_MODULES}/ether_ip")
epicsEnvSet("CWD",       "${PWD}")
epicsEnvSet("DB_TOP",    "$(CWD)/db")
epicsEnvSet("LOCATION",  "TESTLAB")
epicsEnvSet("SYSSUBSYS", "LBNL")
epicsEnvSet("DEVDI",     "ABPLC")
epicsEnvSet("IOCNAME",   "$(SYSSUBSYS):$(DEVDI)")
epicsEnvSet("USERNAME",  "${USER}")


# Load dbd, register the drvEtherIP.. commands
dbLoadDatabase("$(MOD_TOP)/dbd/eipIoc.dbd")
eipIoc_registerRecordDeviceDriver(pdbbase)

# Initialize EtherIP driver, define PLCs
EIP_buffer_limit(450)
drvEtherIP_init()

EIP_verbosity(7)

# drvEtherIP_define_PLC <name>, <ip_addr>, <slot>
# The driver/device uses the <name> to indentify the PLC.
# 
# <ip_addr> can be an IP address in dot-notation
# or a name about which the IOC knows.
# The IP address gets us to the ENET interface.
# To get to the PLC itself, we need the slot that
# it resides in. The first, left-most slot in the
# ControlLogix crate is slot 0.
drvEtherIP_define_PLC("plc1", "128.3.129.209", 0)

#dbLoadRecords("$(DB_TOP)/ramp.db",    "IOC=test")
#dbLoadRecords("$(DB_TOP)/eip_stat.db","PLC=plc1,IOC=test,TAG=REAL")
dbLoadRecords("$(DB_TOP)/ai.db",      "PLC=plc1,IOC=test")
dbLoadRecords("$(DB_TOP)/ana.db",     "PLC=plc1,IOC=test")
dbLoadRecords("$(DB_TOP)/bi.db",      "PLC=plc1,IOC=test")
dbLoadRecords("$(DB_TOP)/bin.db",     "PLC=plc1,IOC=test")
dbLoadRecords("$(DB_TOP)/mbbi.db",    "PLC=plc1,IOC=test")
dbLoadRecords("$(DB_TOP)/ao.db",      "PLC=plc1,IOC=test")
dbLoadRecords("$(DB_TOP)/bo.db",      "PLC=plc1,IOC=test")
#dbLoadRecords("../../db/test.db", "PLC=plc1,IOC=test")
#dbLoadRecords("../../db/mod.db", "PLC=plc1,IOC=test")
#dbLoadRecords("../../db/brad2.db", "PLC=plc1,IOC=test")

#iocInit()


dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF