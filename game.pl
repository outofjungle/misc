#!/usr/bin/env perl

use strict;
use constant THRESHOLD => 10000;

my $stack = {
    1 => 'red',
    2 => 'red',
    3 => 'red',
    4 => 'blue',
    5 => 'blue',
    6 => 'blue',
};

sub draw {
    my $stack = shift;
    my @sides = keys %{$stack};
    return $sides[ rand @sides ]; 
}

sub flip {
    my $side = shift;
    my $shift = ( $side % 2 == 0 ) ? -1 : 1;    
    return $side + $shift;
}

my $count = {};
do {
    my $face = draw( $stack );
    my $color = $stack->{$face};
    $count->{$color}->{count}++;

    $face = flip( $face );
    my $flip_color = $stack->{$face};        
    $count->{$color}->{$flip_color}->{count}++;

} while ( $count->{red}->{count} < THRESHOLD );

printf (
    "(# red second draw )/(# red first draw red ): %f\n",
    $count->{red}->{red}->{count} / $count->{red}->{count} 
);

