#!perl -w

use strict;
use Test::More qw(no_plan);
use File::Binary;

my $bin = File::Binary->new('t/le.power10.u8.ints');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

is($bin->get_ui8(),1);
is($bin->get_ui8(),10);
is($bin->get_ui8(),100);


$bin->close();



$bin = File::Binary->new('>t/temp');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

ok($bin->put_ui8(1));
ok($bin->put_ui8(10));
ok($bin->put_ui8(100));


$bin->close();


$bin = File::Binary->new('t/temp');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

is($bin->get_ui8(),1);
is($bin->get_ui8(),10);
is($bin->get_ui8(),100);


$bin->close();

