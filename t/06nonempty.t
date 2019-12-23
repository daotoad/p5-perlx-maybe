use Test::More tests => 2;
use PerlX::Maybe qw< nonempty >;

{ # Nonempty items
  my $hash_ref   = { a => 1 };
  my $array_ref  = [];
  my $scalar_ref = \'';
  my $scalar     = 'stuff';
  is_deeply(
	  [ nonempty $hash_ref, nonempty $array_ref, nonempty $scalar_ref, nonempty $scalar ],
	  [ $hash_ref, $array_ref, $scalar_ref, $scalar ],
    'Nonempty values detected'
	  );
}

{ # Empty items
  my $hash_ref   = {};
  my $array_ref  = [];
  my $scalar_ref = \undef;
  my $scalar     = '';
  is_deeply(
	  [ nonempty $hash_ref, nonempty $array_ref, nonempty $scalar_ref, nonempty $scalar ],
	  [ undef, undef, undef, undef ],
    'Nonempty values detected'
	  );
}

# TODO - Test overloaded objects.

done_testing;
