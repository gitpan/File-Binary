#!perl -w

use strict;
use Test::More qw(no_plan);
use File::Binary;

my $bin = File::Binary->new('t/be.power10.u16.ints');
$bin->set_endian($File::Binary::BIG_ENDIAN);

is($bin->get_ui16(),1);
is($bin->get_ui16(),10);
is($bin->get_ui16(),100);
is($bin->get_ui16(),1000);
is($bin->get_ui16(),10000);


$bin->close();



$bin = File::Binary->new('>t/temp');
$bin->set_endian($File::Binary::BIG_ENDIAN);

ok($bin->put_ui16(1));
ok($bin->put_ui16(10));
ok($bin->put_ui16(100));
ok($bin->put_ui16(1000));
ok($bin->put_ui16(10000));


$bin->close();


$bin = File::Binary->new('t/temp');
$bin->set_endian($File::Binary::BIG_ENDIAN);

is($bin->get_ui16(),1);
is($bin->get_ui16(),10);
is($bin->get_ui16(),100);
is($bin->get_ui16(),1000);
is($bin->get_ui16(),10000);


$bin->close();

