# EPAgent Plugins for Solaris (1.1)

This is a series of plugins for monitoring the OS.

sunDiskStats.pl - gathers I/O statistics for mount points.  
mpstat.pl - gathers per processor statistics.  

Tested with CA APM 9.7.1 EM, EPAgent 9.7.1, and Perl 5.22.

##Known Issues
-None

#Licensing
FieldPacks are provided under the Apache License, version 2.0. See [Licensing](https://www.apache.org/licenses/LICENSE-2.0).


# Installation Instructions

Follow the instructions in the EPAgent guide to setup the agent.

Add stateless plugin entries to \<epa_home\>/IntroscopeEPAgent.properties.

	introscope.epagent.plugins.stateless.names=DISKSTAT,MPSTAT (can be appended to a previous entry)
	introscope.epagent.stateless.DISKSTAT.command=perl <epa_home>/epaplugins/sun/sunDiskStats.pl
	introscope.epagent.stateless.DISKSTAT.delayInSeconds=900
	introscope.epagent.stateless.MPSTAT.command=perl <epa_home>/epaplugins/sun/mpstat.pl
	introscope.epagent.stateless.MPSTAT.delayInSeconds=900

# Usage Instructions
No special instructions needed for DiskStats.

Start the EPAgent using the provided control script in \<epa_home\>/bin.

##How to debug and troubleshoot the field pack
Update the root logger in \<epa_home\>/IntroscopeEPAgent.properties from INFO to DEBUG, then save. No need to restart the JVM.
You can also manually execute the plugins from a console and use perl's built-in debugger.

##Disclaimer
This document and associated tools are made available from CA Technologies as examples and provided at no charge as a courtesy to the CA APM Community at large. This resource may require modification for use in your environment. However, please note that this resource is not supported by CA Technologies, and inclusion in this site should not be construed to be an endorsement or recommendation by CA Technologies. These utilities are not covered by the CA Technologies software license agreement and there is no explicit or implied warranty from CA Technologies. They can be used and distributed freely amongst the CA APM Community, but not sold. As such, they are unsupported software, provided as is without warranty of any kind, express or implied, including but not limited to warranties of merchantability and fitness for a particular purpose. CA Technologies does not warrant that this resource will meet your requirements or that the operation of the resource will be uninterrupted or error free or that any defects will be corrected. The use of this resource implies that you understand and agree to the terms listed herein.

Although these utilities are unsupported, please let us know if you have any problems or questions by adding a comment to the CA APM Community Site area where the resource is located, so that the Author(s) may attempt to address the issue or question.

Unless explicitly stated otherwise this field pack is only supported on the same platforms as the APM core agent. See [APM Compatibility Guide](http://www.ca.com/us/support/ca-support-online/product-content/status/compatibility-matrix/application-performance-management-compatibility-guide.aspx).


# Change log
Changes for each version of the field pack.

Version | Author | Comment
--------|--------|--------
1.0 | Hiko Davis | First bundled version of the field packs.
1.1 | Hiko Davis | Updated README and added mpstat monitoring.
