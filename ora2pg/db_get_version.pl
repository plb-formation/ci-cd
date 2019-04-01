#! /bin/env perl

BEGIN {
 $ENV{LD_LIBRARY_PATH}='/usr/lib/oracle/11.2/client64/lib';
}

use strict;
use DBI;
use DBD::Oracle;


my $machine = 'localhost';
my $port    = 11521;
my $sid     = 'xe';
my $user = 'monitor';
my$pass = 'qwertyuiop';

my $dbh = DBI->connect("dbi:Oracle://$machine:$port/$sid", $user, $pass,{AutoCommit=>1, RaiseError=>1}) ||  die "Failed to connect: $DBI::errstr\n";


my $sth= $dbh->prepare('SELECT version FROM v$instance');
$sth->execute();
while ( my ($key) = $sth->fetchrow())
{
   print $key;
}
