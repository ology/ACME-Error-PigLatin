#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::Exception;

use_ok 'ACME::Error', 'PigLatin';

throws_ok { die 'Oof!' }
    qr/^Oofway!/, 'dies in piglatin';

diag 'Not sure how to test redefined warn';

done_testing();
