#!/usr/bin/perl
use strict;
use warnings;
use CXGN::DB::Connection;
use CXGN::DB::SQLWrappers;
use Test::More tests => 7;

my $existing_enzyme = 'EcoRI';

my $dbh = CXGN::DB::Connection->new;
my $sql = CXGN::DB::SQLWrappers->new($dbh);

my @ids = $sql->select('enzymes',{enzyme_name => $existing_enzyme});

ok($ids[0],"Existing enzyme $existing_enzyme should have been found, ID $ids[0].");

my $id = $sql->insert('enzymes',{enzyme_name => 'NewEnzyme'});

ok($id,"New enzyme should have been inserted with id $id.");

my $info = $sql->insert_unless_exists('enzymes',{enzyme_name =>'NewEnzyme'});

ok(!$info->{inserted},"Insert unless exists should not have inserted anything, since it was just inserted.");

ok($info->{exists},"Insert unless exists should have found that this row exists already. ID $info->{exists}->[0].");

$info = $sql->insert_unless_exists('enzymes',{enzyme_name =>'NewEnzyme2'});

ok($info->{inserted},"This time, insert unless exists should have inserted a new enzyme, ID $info->{inserted}.");

ok(!$info->{exists},"Insert unless exists should not have found that this row exists already.");

@ids = $sql->select('accession',{organism_id =>3,common_name =>undef,accession_name_id =>1});

is($ids[0], 1,"Existing accession should have been found.");

$dbh->rollback();
