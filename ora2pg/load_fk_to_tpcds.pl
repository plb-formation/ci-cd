#! /bin/env perl

use strict;
use DBI;
use DBD::Oracle;

my $machine = 'oracle-11g';
my $port    = 1521;
my $sid     = 'xe';
my $user = 'tpcds';
my$pass = 'p4ssw0rd';

my $dbh = DBI->connect("dbi:Oracle://$machine:$port/$sid", $user, $pass,{AutoCommit=>1, RaiseError=>1}) ||  die "Failed to connect: $DBI::errstr\n";

my @list_of_keys= ();

my $sth= $dbh->prepare('SELECT cd_demo_sk FROM customer_demographics');
$sth->execute();
while ( my ($key) = $sth->fetchrow())
{
    push @list_of_keys, $key;
}

#print "@list_of_keys\n";
my $total_keys= scalar @list_of_keys;
#my $a = 1 + int rand($total_keys);
#print $list_of_keys[$a];


# =======================   CR_REFUNDED_CDEMO_SK ======================================
my $count=1;
$sth= $dbh->prepare('SELECT cr_refunded_cdemo_sk from catalog_returns');
$sth->execute();
my $random= 0;
my $value=0;
while ( my ($key) = $sth->fetchrow())
{
    $random = 1 + int rand($total_keys);
    $value =  $list_of_keys[$random];
    my $update= $dbh->prepare('UPDATE catalog_returns SET cr_refunded_cdemo_sk=:value where cr_refunded_cdemo=:key and cr_refunded_cdemo_sk is not null');
    $update->bind_param(":key",$key);
    $update->bind_param(":value",$value);
    $update->execute();
    print $count;
    $count +=1;
}
#=======================  CS_BILL_CDEMO_SK ==============================================
$count=1;
$sth= $dbh->prepare('SELECT cs_bill_cdemo_sk from catalog_sales');
$sth->execute();
$random= 0;
while ( my ($key) = $sth->fetchrow())
{
    $random = 1 + int rand($total_keys);
    $value=  $list_of_keys[$random];
    my $update= $dbh->prepare('UPDATE catalog_sales SET cs_bill_cdemo_sk=:value where cs_bill_cdemo_sk=:key and cs_bill_cdemo_sk is not null ');
    $update->bind_param(":key",$values);
    $update->bind_param(":value",$value);
    $update->execute();
    #print $count;
    $count +=1;
}


#=======================  C_CURRENT_CDEMO_SK ==============================================
$count=1;
$sth= $dbh->prepare('SELECT  c_current_cdemo_sk from customer');
$sth->execute();
$random= 0;
$value= 0;
while ( my ($key) = $sth->fetchrow())
{
    $random = 1 + int rand($total_keys);
    $value=  $list_of_keys[$random];
    my $update= $dbh->prepare('UPDATE customer SET c_current_cdemo_sk=:value where c_current_cdemo_sk=:key and c_current_cdemo_sk is not null');
    $update->bind_param(":value",$value);
    $update->bind_param(":key",$key);
    $update->execute();
    print $value .  "\t" .  $count ."\n";
    $count +=1;
}

