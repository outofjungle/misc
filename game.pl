#!/usr/bin/env perl

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
    $face = draw( $stack );
    $color = $stack->{$face};
    $count->{$color}->{count}++;

    if ( $color eq 'red' ) {
        $face = flip( $face );
        $color = $stack->{$face};        
        $count->{red}->{$color}->{count}++;
    }
} while ( $count->{red}->{count} < THRESHOLD );

printf ( "%f\n", $count->{red}->{red}->{count} / $count->{red}->{count} );

