#!/usr/bin/env perl

use warnings;
use strict;

my $namespace = shift;

my $found = 0;
while (<>) {
   next unless m{parser::yytname_\[\]\s=};
   $found = 1;
   last;
}
die "start of yytname table not found\n" unless $found;
print "namespace $namespace {\n";
print "extern const char* const yytname[] =\n";
while (<>) {
   s{,?\s*YY_NULL\b}{}; 
   print $_;
   last if m{\};$}
}
print "}\n";
