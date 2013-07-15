#!/usr/bin/perl -W

use Data::Dumper;
use POSIX;
use strict;


my $INPUT = <>;

my @array = split(' ', $INPUT);

my @sortedArray = sort(@array);

my $rows = ceil(@array/3);

my @spliced = partition_array($rows,@sortedArray);

my @done = ();

for (my $row = 0; $row  < $rows; ++$row) {
	for (my $col = 0; $col < 3; ++$col) {
		my $value = $spliced[$col][$row];
		print $value, " " if defined($value);
	}
	print "\n";
}


sub partition_array { 
	my $size = shift;
	my @original = @_;
	my @new = ();
	my @temp = ();
	while (scalar(@original)) {
		@temp = [splice(@original, 0, $size)];
		push(@new, @temp);
	}
	return @new;
}
