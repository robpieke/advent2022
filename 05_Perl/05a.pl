use strict;
use warnings;

open my $info, "input.txt";

my @stacks = ();

while (my $line = <$info>) {
    # Move operators
    if ($line =~ /move (\d+) from (\d+) to (\d+)/) {
        my $n = $1;
        my $from = $2 - 1;
        my $to = $3 - 1;
        $stacks[$to] = reverse(substr($stacks[$from], 0, $n)) . $stacks[$to];
        $stacks[$from] = substr($stacks[$from], $n);
    }
    # Initial setup
    else
    {
        if ($#stacks == -1) {
            for my $i (0 .. length($line)/4) {
                push(@stacks, (""));
            }
        }
        for my $i (0 .. length($line)) {
            my $char = substr($line, $i, 1);
            unless ($char =~ /[ \[\]\d\n]/) {
                $stacks[$i/4] .= $char;
            }
        }
    }
}

close $info;

foreach (@stacks) {
    print substr($_, 0, 1);
}
print "\n";
