# EPAgent/APMIA Plugins for Solaris (1.5)

# Description
This is a series of plugins for monitoring the OS.

sunDiskStats.pl - gathers I/O statistics for mount points.  
sunMpStats.pl - gathers per-processor statistics  
sunVmStats.pl - gathers memory statistics


# Dependencies
Tested with CA APM 9.7.1 EM+, EPAgent 9.7.1+, Infrastructure Agent 10.7, and Perl 5.22+.


## Known Issues
None

# Licensing
FieldPacks are provided under the Apache License, version 2.0. See [Licensing](https://www.apache.org/licenses/LICENSE-2.0).


# Installation Instructions

## EPAgent Instructions
Copy the contents of pre-10.5 to &lt;epa_home&gt;.

Add stateless plugin entries to &lt;epa_home&gt;/IntroscopeEPAgent.properties.

	introscope.epagent.plugins.stateless.names=DISKSTAT,MPSTAT,VMSTAT (can be appended to a previous entry)
	introscope.epagent.stateless.DISKSTAT.command=perl <epa_home>/epaplugins/solaris/sunDiskStats.pl
	introscope.epagent.stateless.DISKSTAT.delayInSeconds=15
	introscope.epagent.stateless.MPSTAT.command=perl <epa_home>/epaplugins/solaris/sunMpStats.pl
	introscope.epagent.stateless.MPSTAT.delayInSeconds=900
	introscope.epagent.stateless.VMSTAT.command=perl <epa_home>/epaplugins/solaris/sunVmStats.pl
	introscope.epagent.stateless.VMSTAT.delayInSeconds=900
## APMIA instructions (without ACC bundle)
* Create a subdirectory called _SolarisMonitor_ and copy in the contents of _post-10.5_ to &lt;apmia_home&gt;/extensions.  
* Edit &lt;apmia_home&gt;/extensions/Extensions.profile  
* Add your extension directory name to the list in property  

    introscope.agent.extensions.bundles.boot.load=SolarisMonitor
    

## APMIA instructions (with ACC bundle)
* Export the bundle using the Bundle URL in ACC.
* Copy the GZIP to &lt;apmia_home&gt;/extensions/deploy.  

_N.B._: No changes are necessary to Extensions.profile since the edits were done in ACC.

Restart the agent to complete the installation.

# Usage Instructions  

## How to create an ACC bundle for Infrastructure Agent (APMIA)
* The files located in the 'post-10.5' folder are already preconfigured for creating a bundle. Place a copy of your CLI file in the _data_ folder.  
Delete 'readme.txt' in this folder.   
* Obtain a copy of 'PrintMetric.pm' from your EPAgent archive and place in the 'lib/perl/Wily'.  
Delete 'readme.txt' in this folder.  
* Update 'description.md' and 'bundle.json' in the _metadata_ folder.  
* Create a ZIP file of the 'post-10.5' contents, ensuring you don't include the parent folder.  
* Upload the ZIP file to your ACC instance.

## How to debug and troubleshoot the field pack
Update the root logger in &lt;epa_home&gt;/IntroscopeEPAgent.properties from INFO to DEBUG, then save. No need to restart the JVM.
You can also manually execute the plugins from a console and use perl's built-in debugger.

If you still need assistance after testing, please open a new discussion on [CA APM DEV](http://bit.ly/caapm_dev).

## Future work
Anybody can contribute to this project over GitHub, e.g. changing a property in a configuration file on every EM, backup/copy configuration or data files, restarting a process, ...

## Support
This document and associated tools are made available from CA Technologies as examples and provided at no charge as a courtesy to the CA APM Community at large. This resource may require modification for use in your environment. However, please note that this resource is not supported by CA Technologies, and inclusion in this site should not be construed to be an endorsement or recommendation by CA Technologies. These utilities are not covered by the CA Technologies software license agreement and there is no explicit or implied warranty from CA Technologies. They can be used and distributed freely amongst the CA APM Community, but not sold. As such, they are unsupported software, provided as is without warranty of any kind, express or implied, including but not limited to warranties of merchantability and fitness for a particular purpose. CA Technologies does not warrant that this resource will meet your requirements or that the operation of the resource will be uninterrupted or error free or that any defects will be corrected. The use of this resource implies that you understand and agree to the terms listed herein.

Although these utilities are unsupported, please let us know if you have any problems or questions by adding a comment to the CA APM Community Site area where the resource is located, so that the Author(s) may attempt to address the issue or question.

Unless explicitly stated otherwise this extension is only supported on the same platforms as the APM core agent. See [APM Compatibility Guide](http://www.ca.com/us/support/ca-support-online/product-content/status/compatibility-matrix/application-performance-management-compatibility-guide.aspx).

### Support URL
https://github.com/htdavis/ca-apm-fieldpack-epa-solaris/issues

# Contributing
The [CA APM Community](https://communities.ca.com/community/ca-apm) is the primary means of interfacing with other users and with the CA APM product team.  The [developer subcommunity](https://communities.ca.com/community/ca-apm/ca-developer-apm) is where you can learn more about building APM-based assets, find code examples, and ask questions of other developers and the CA APM product team.

If you wish to contribute to this or any other project, please refer to [easy instructions](https://communities.ca.com/docs/DOC-231150910) available on the CA APM Developer Community.

# Change log
Changes for each version of the field pack.

Version | Author | Comment
--------|--------|--------
1.0 | Hiko Davis | First bundled version of the field packs.
1.1 | Hiko Davis | Updated README and added mpstat monitoring.
1.2 | Hiko Davis | Fixed mpstat.pl.
1.3 | Hiko Davis | Added vmstat and reorganized for ACC/APMIA.
1.4 | Hiko Davis | Updated iostat logic in sunDiskStats.pl.
1.5 | Hiko Davis | Updated iostat interval, relabeled metric names, developer details.

## Support URL
https://github.com/htdavis/ca-apm-fieldpack-epa-solaris

## Short Description
Monitor Solaris OS

## Categories
Server Monitoring