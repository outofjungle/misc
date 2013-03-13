#!/usr/bin/env perl

use strict;
use constant THRESHOLD => 10000;

my $stack = {
    1 => 'red',   # card 1, side A
    2 => 'red',   # card 1, side B
    3 => 'red',   # card 2, side A
    4 => 'blue',  # card 2, side B
    5 => 'blue',  # card 3, side A
    6 => 'blue',  # card 3, side B
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

