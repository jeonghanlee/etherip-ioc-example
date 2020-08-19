#! ../../epics-7.0.4/epics-modules/ether_ip/bin/linux-x86/eipIoc

epicsEnvSet("MOD_TOP",  "${EPICS_MODULES}/ether_ip")
epicsEnvSet("CWD",       "${PWD}")
epicsEnvSet("DB_TOP",    "$(CWD)/db")
epicsEnvSet("LOCATION",  "TESTLAB")
epicsEnvSet("SYSSUBSYS", "LBNL")
epicsEnvSet("DEVDI",     "ABPLC")
epicsEnvSet("IOCNAME",   "$(SYSSUBSYS):$(DEVDI)")
epicsEnvSet("USERNAME",  "${USER}")


dbLoadDatabase("$(MOD_TOP)/dbd/eipIoc.dbd")
eipIoc_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("PLC_NAME", "ABPLC-B46")


system "bash $(CWD)/scripts/host_ip.bash"

iocshLoad("$(CWD)/iocsh/intf_addr.iocsh")

iocshLoad("$(CWD)/iocsh/plcinfo.iocsh")



iocshLoad("$(CWD)/iocsh/etherip.iocsh", "NAME=$(PLC_NAME),INET=$(PLC_INET)")

dbLoadRecords("$(DB_TOP)/mmt_bi_bo.db", "P=$(IOCNAME):,PLC=$(PLC_NAME)")
dbLoadRecords("$(DB_TOP)/mmt_dipb.db", "P=$(IOCNAME):,PLC=$(PLC_NAME),ID=1")
dbLoadRecords("$(DB_TOP)/mmt_dipb.db", "P=$(IOCNAME):,PLC=$(PLC_NAME),ID=2")

iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF