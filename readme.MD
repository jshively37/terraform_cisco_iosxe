# Terraform Interface Configuration

This will use the Cisco DevNet Terraform provider to create/update/delete loopback interface on a CSR1000V router.

Tested using eve-ng on Cisco IOS version:
```
csr1000v_1#sh ver
Cisco IOS XE Software, Version 17.03.04a
Cisco IOS Software [Amsterdam], Virtual XE Software (X86_64_LINUX_IOSD-UNIVERSALK9-M), Version 17.3.4a, RELEASE SOFTWARE (fc3)
Technical Support: http://www.cisco.com/techsupport
Copyright (c) 1986-2021 by Cisco Systems, Inc.
Compiled Tue 20-Jul-21 04:59 by mcpre


Cisco IOS-XE software, Copyright (c) 2005-2021 by cisco Systems, Inc.
All rights reserved.  Certain components of Cisco IOS-XE software are
licensed under the GNU General Public License ("GPL") Version 2.0.  The
software code licensed under GPL Version 2.0 is free software that comes
with ABSOLUTELY NO WARRANTY.  You can redistribute and/or modify such
GPL code under the terms of GPL Version 2.0.  For more details, see the
documentation or "License Notice" file accompanying the IOS-XE software,
or the applicable URL provided on the flyer accompanying the IOS-XE
software.


ROM: IOS-XE ROMMON
```

CSR1000V Base Authentication Configuration:
```
aaa new-model
!
!
aaa authentication login default local
aaa authorization exec default local
aaa authorization commands 15 default local
!
ip http authentication local
ip http secure-server
ip http client source-interface GigabitEthernet1
!
netconf-yang
restconf
```
