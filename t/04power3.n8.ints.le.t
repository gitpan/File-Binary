#!perl -w

use strict;
use Test::More qw(no_plan);
use File::Binary;

my $bin = File::Binary->new('t/le.power3.n8.ints');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

is($bin->get_si8(),-1);
is($bin->get_si8(),-3);
is($bin->get_si8(),-9);
is($bin->get_si8(),-27);
is($bin->get_si8(),-81);


$bin->close();



$bin = File::Binary->new('>t/temp');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

ok($bin->put_si8(-1));
ok($bin->put_si8(-3));
ok($bin->put_si8(-9));
ok($bin->put_si8(-27));
ok($bin->put_si8(-81));


$bin->close();


$bin = File::Binary->new('t/temp');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

is($bin->get_si8(),-1);
is($bin->get_si8(),-3);
is($bin->get_si8(),-9);
is($bin->get_si8(),-27);
is($bin->get_si8(),-81);


$bin->close();

