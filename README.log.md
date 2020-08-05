

```bash
$ ether_ip_test -i 128.3.129.209 -s 0 -v 10

....
....

Identity information of target:
    UINT vendor         = 0x0001
    UINT device_type    = 0x000E
    UINT revision       = 0x0C20
    UDINT serial_number = 0x60883F7F
    USINT name          = '5069-L340ERM/A'
EIP disconnecting socket 3
1 test runs, 0.00621104 seconds -> 6.211042 ms / tag
jeonglee@parity: linux-x86_64$ 
```


$ ether_ip_test -i 128.3.129.209 -s 0 -v 
Segmentation fault


$ ether_ip_test -i 128.3.129.209 -s 0 MMT_DIPB1_FM1_FlowOK
Tag 'MMT_DIPB1_FM1_FlowOK'
BOOL 1
1 test runs, 0.00538588 seconds -> 5.385876 ms / tag


$ ether_ip_test -i 128.3.129.209 -s 0 MMT_DIPB1_FM1_Flow
Tag 'MMT_DIPB1_FM1_Flow'
REAL 0.000000
1 test runs, 0.00575995 seconds -> 5.759954 ms / tag



$ /home/jeonglee/bin/ether_ip_test -i 128.3.129.209 -s 0 MMT_DIPB1_FM1_FlowOK
Tag 'MMT_DIPB1_FM1_FlowOK'
BOOL 1
1 test runs, 0.00648713 seconds -> 6.487131 ms / tag
 /home/jeonglee/bin/ether_ip_test -i 128.3.129.209 -s 0 MMT_DIPB1_FM1_FlowOK_Bypass
Tag 'MMT_DIPB1_FM1_FlowOK_Bypass'
BOOL 0
1 test runs, 0.0063231 seconds -> 6.323099 ms / tag
$ /home/jeonglee/bin/ether_ip_test -i 128.3.129.209 -s 0 MMT_DIPB1_FM1_FlowOKLatch
Tag 'MMT_DIPB1_FM1_FlowOKLatch'
BOOL 1
1 test runs, 0.0054698 seconds -> 5.469799 ms / tag


