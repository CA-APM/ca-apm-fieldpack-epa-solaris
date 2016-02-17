#!/bin/perl
#############################################################
# Solaris Disk Stats
# =========================
# Copyright (C) 2011
# =========================
# Description: 
# This perl program emulates the functionality seen in
# aixDiskStats.pl. The program will create two nodes: Device, which
# provides metrics by device name; Disk, which provides metrics by mount point.
# N.B.: Inode metrics are currently unavailable for the version of DF
# used in Solaris.
# =========================
# Usage: perl mpstat.pl
#
#############################################################
use FindBin;
use lib ("$FindBin::Bin", "$FindBin::Bin/lib/perl", "$FindBin::Bin/../lib/perl");
use Wily::PrintMetric;

use strict;

# get the mounted disks specified on the command line
my $mountedDisksRegEx = '.'; # default is match all
if (scalar(@ARGV) > 0) {
	$mountedDisksRegEx = join('|', @ARGV);
}

# iostat command for Solaris
my $iostatCommand = 'iostat -rx';
# Get the device stats
my @iostatResults = `$iostatCommand`;
# Get rid of the header lines for each command
@iostatResults = @iostatResults[2..$#iostatResults];
# The -r option for iostat prints out the stats separated by
# commas, so grab all of them
# Output on Solaris:
#extended device statistics
#device,r/s,w/s,kr/s,kw/s,wait,actv,svc_t,%w,%b,
#cmdk0,0.1,0.2,5.5,1.2,0.0,0.0,12.3,0,0
#sd0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0,0

# parse the iostat results and report the
# relevant data using metrics
foreach my $isline (@iostatResults) {
	chomp $isline; # remove trailing new line
	my @deviceStats = split ',', $isline;
	my $device = $deviceStats[0];

	# now, check to see if the user specified this device on the command
	# line.
	next if $device !~ /$mountedDisksRegEx/i;
	
	# report iostats
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'Reads/sec',
                                  value       => int ($deviceStats[1]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'Writes/sec',
                                  value       => int ($deviceStats[2]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'KB Read/sec',
                                  value       => int ($deviceStats[3]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'KB Written/sec',
                                  value       => int ($deviceStats[4]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'Avg. Transactions Waiting',
                                  value       => int ($deviceStats[5]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'Avg. Transactions Active',
                                  value       => int ($deviceStats[6]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'Avg. Service Time in Wait Queue (ms)',
                                  value       => int ($deviceStats[7]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => 'Avg. Service Time Active transactions (ms)',
                                  value       => int ($deviceStats[8]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => '% Time Transactions Waiting',
                                  value       => int ($deviceStats[9]),
                                );
  Wily::PrintMetric::printMetric( type        => 'IntCounter',
                                  resource    => 'Device',
                                  subresource => $device,
                                  name        => '% Time Disk Is Busy',
                                  value       => int ($deviceStats[10]),
                                );
}
