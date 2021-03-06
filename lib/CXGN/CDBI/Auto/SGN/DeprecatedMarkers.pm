package CXGN::CDBI::Auto::SGN::DeprecatedMarkers;
# This class is autogenerated by cdbigen.pl.  Any modification
# by you will be fruitless.

=head1 DESCRIPTION

CXGN::CDBI::Auto::SGN::DeprecatedMarkers - object abstraction for rows in the sgn.deprecated_markers table.

Autogenerated by cdbigen.pl.

=head1 DATA FIELDS

  Primary Keys:
      marker_id

  Columns:
      marker_id
      marker_type
      marker_name

  Sequence:
      none

=cut

use base 'CXGN::CDBI::Class::DBI';
__PACKAGE__->table( 'sgn.deprecated_markers' );

our @primary_key_names =
    qw/
      marker_id
      /;

our @column_names =
    qw/
      marker_id
      marker_type
      marker_name
      /;

__PACKAGE__->columns( Primary => @primary_key_names, );
__PACKAGE__->columns( All     => @column_names,      );


=head1 AUTHOR

cdbigen.pl

=cut

###
1;#do not remove
###
