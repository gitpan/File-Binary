#!perl -w

use strict;
use Test::More qw(no_plan);
use File::Binary;

my $bin = File::Binary->new('t/le.power3.u16.ints');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

is($bin->get_ui16(),1);
is($bin->get_ui16(),3);
is($bin->get_ui16(),9);
is($bin->get_ui16(),27);
is($bin->get_ui16(),81);
is($bin->get_ui16(),243);
is($bin->get_ui16(),729);
is($bin->get_ui16(),2187);
is($bin->get_ui16(),6561);
is($bin->get_ui16(),19683);
is($bin->get_ui16(),59049);


$bin->close();



$bin = File::Binary->new('>t/temp');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

ok($bin->put_ui16(1));
ok($bin->put_ui16(3));
ok($bin->put_ui16(9));
ok($bin->put_ui16(27));
ok($bin->put_ui16(81));
ok($bin->put_ui16(243));
ok($bin->put_ui16(729));
ok($bin->put_ui16(2187));
ok($bin->put_ui16(6561));
ok($bin->put_ui16(19683));
ok($bin->put_ui16(59049));


$bin->close();


$bin = File::Binary->new('t/temp');
$bin->set_endian($File::Binary::LITTLE_ENDIAN);

is($bin->get_ui16(),1);
is($bin->get_ui16(),3);
is($bin->get_ui16(),9);
is($bin->get_ui16(),27);
is($bin->get_ui16(),81);
is($bin->get_ui16(),243);
is($bin->get_ui16(),729);
is($bin->get_ui16(),2187);
is($bin->get_ui16(),6561);
is($bin->get_ui16(),19683);
is($bin->get_ui16(),59049);


$bin->close();

