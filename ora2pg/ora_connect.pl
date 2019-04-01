#! /bin/env perl

use strict;
use DBI;
use DBD::Oracle;

my $machine = 'oracle-11g';
my $port    = 1521;
my $sid     = 'xe';
my $user = 'system';
my$pass = 'oracle';

my $dbh = DBI->connect("dbi:Oracle://$machine:$port/$sid", $user, $pass) ||  die "Failed to connect: $DBI::errstr\n";
