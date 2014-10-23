#!perl -w

use strict;
use Test::More qw(no_plan);
use File::Binary;

my $bin = File::Binary->new('t/be.power10.n8.ints');
$bin->set_endian($File::Binary::BIG_ENDIAN);

is($bin->get_si8(),-1);
is($bin->get_si8(),-10);
is($bin->get_si8(),-100);


$bin->close();



$bin = File::Binary->new('>t/temp');
$bin->set_endian($File::Binary::BIG_ENDIAN);

ok($bin->put_si8(-1));
ok($bin->put_si8(-10));
ok($bin->put_si8(-100));


$bin->close();


$bin = File::Binary->new('t/temp');
$bin->set_endian($File::Binary::BIG_ENDIAN);

is($bin->get_si8(),-1);
is($bin->get_si8(),-10);
is($bin->get_si8(),-100);


$bin->close();

