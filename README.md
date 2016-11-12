# EPAgent Plug-ins for Solaris

# Description
EPAgent Plug-ins for Solaris monitor the Solaris operating system.

* The sunDiskStats.pl script gathers I/O statistics for mount points.
* The mpstat.pl script gathers per-processor statistics

For installation instructions, see the README.md file.

# Short Description
EPAgent Plug-ins for Solaris monitor the Solaris operating system.

# APM Version
Tested with CA APM 9.7.1 Enterprise Manager, EPAgent 9.7.1, and Perl 5.22.

# Dependencies
Tested with CA APM 9.7.1 Enterprise Manager, EPAgent 9.7.1, and Perl 5.22.

# Licensing
Apache License, version 2.0. See [Licensing](https://www.apache.org/licenses/LICENSE-2.0).

# Prerequisite
An installed and configured EPAgent.

Find the version 9.7 to 10.x documentation on [the CA APM documentation wiki.](https://docops.ca.com)

# Install and Configure the EPAgent Plug-ins for Solaris

1. Download the extension from the [CA APM Marketplace.] (http://marketplace.ca.com/shop/ca/?cat=29)
2. Extract the plug-in to <*EPAgent_Home*>\epaplugins.
2. Configure the IntroscopeEPAgent.properties file in <*EPAgent_Home*> by adding these stateless plug-in properties:
```
	introscope.epagent.plugins.stateless.names=DISKSTAT,MPSTAT (can be appended to a previous entry)
	introscope.epagent.stateless.DISKSTAT.command=perl <epa_home>/epaplugins/sun/sunDiskStats.pl
	introscope.epagent.stateless.DISKSTAT.delayInSeconds=900
	introscope.epagent.stateless.MPSTAT.command=perl <epa_home>/epaplugins/sun/mpstat.pl
	introscope.epagent.stateless.MPSTAT.delayInSeconds=900
```
# Use the EPAgent Plug-ins for Solaris
Start the EPAgent using the control script in the <*EPAgent_Home*>/bin directory.

# Debug and Troubleshoot
Update the root logger in <*EPAgent_Home*>/IntroscopeEPAgent.properties from INFO to DEBUG, then save. No managed appklication restart needed.

You can also manually execute the plug-in from a console and use the PERL built-in debugger.

# Support
This document and plug-in are made available from CA Technologies. They are provided as examples at no charge as a courtesy to the CA APM Community at large. This plug-in might require modification for use in your environment. However, this plug-in is not supported by CA Technologies, and inclusion in this site should not be construed to be an endorsement or recommendation by CA Technologies. This plug-in is not covered by the CA Technologies software license agreement and there is no explicit or implied warranty from CA Technologies. The plug-in can be used and distributed freely amongst the CA APM Community, but not sold. As such, it is unsupported software, provided as is without warranty of any kind, express or implied, including but not limited to warranties of merchantability and fitness for a particular purpose. CA Technologies does not warrant that this resource will meet your requirements or that the operation of the resource will be uninterrupted or error free or that any defects will be corrected. The use of this plug-in implies that you understand and agree to the terms listed herein.
Although this plug-in is unsupported, please let us know if you have any problems or questions. You can add comments to the CA APM Community site so that the author(s) can attempt to address the issue or question.
Unless explicitly stated otherwise this plug-in is only supported on the same platforms as the CA APM Java agent. 

# Support URL
https://github.com/htdavis/ca-apm-fieldpack-epa-solaris

# Categories
Server Monitoring

# Product Compatibilty Matrix
http://pcm.ca.com/

# Change Log
Changes for each plug-in version.

Version | Author | Comment
--------|--------|--------
1.0 | Hiko Davis | First version of the plug-in.
1.1 | Hiko Davis | Updated README and added mpstat monitoring.
1.2 | Hiko Davis | Fixed mpstat.pl.