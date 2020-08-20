# etherip-ioc-example

## ether_ip supports data type

```c
in ether_ip.h
    T_CIP_BOOL   = 0x00C1
    T_CIP_SINT   = 0x00C2
    T_CIP_INT    = 0x00C3
    T_CIP_DINT   = 0x00C4
    T_CIP_REAL   = 0x00CA
    T_CIP_BITS   = 0x00D3
    T_CIP_STRUCT = 0x02A0
```

## Tested IOC Data Types (supported by ether_ip)

* BOOL : Logical Boolean with values TRUE and FALSE (C1)

* SINT : Signed  8–bit integer value (C2)

* DINT : Signed 32–bit integer value (C4)

* REAL : 32–bit floating point value (CA)

## PLC Data Type (not supported)

* LINT : Signed 64–bit integer value (C5)

`EIP get_CIP_UDINT: unknown type 197`

* String140 (84A8) subtype : DC7F)

`EIP get_CIP_STRING: unknown subtype 56447`
