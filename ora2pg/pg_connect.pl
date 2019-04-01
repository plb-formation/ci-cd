#! /bin/env perl

use strict;
use DBI;
use DBD::Pg;

my $host = 'postgresql-11';
my $port    = 5432;
my $dbname = 'template1';
my $user = 'postgres';
my $pass = 'password';

my $dbh = DBI->connect("dbi:Pg:dbname=$dbname;host=$host;port=$port", $user, $pass) ||  die "Failed to connect: $DBI::errstr\n";
