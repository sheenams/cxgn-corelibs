
use strict;

use Test::More tests=>6;

BEGIN { 
    use_ok('CXGN::DB::Connection');
    use_ok('CXGN::People::Login');
}

use CXGN::DB::Connection;
use CXGN::People::Login;

CXGN::DB::Connection->verbose(0);
my $dbh = CXGN::DB::Connection->new();

my $l = CXGN::People::Login->new($dbh, 222);

is($l->get_username(), "lam87\@cornell.edu", "username test");
is($l->get_password(), "hallohallo", "password test");
is($l->get_disabled(), undef, "account disabled test");
is($l->get_user_type(), "curator", "user type test");

