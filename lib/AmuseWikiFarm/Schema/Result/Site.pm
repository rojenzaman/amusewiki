use utf8;
package AmuseWikiFarm::Schema::Result::Site;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AmuseWikiFarm::Schema::Result::Site

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<site>

=cut

__PACKAGE__->table("site");

=head1 ACCESSORS

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 8

=head2 mode

  data_type: 'varchar'
  default_value: 'blog'
  is_nullable: 0
  size: 16

=head2 locale

  data_type: 'varchar'
  default_value: 'en'
  is_nullable: 0
  size: 3

=head2 sitename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 siteslogan

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 theme

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 logo

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 mail

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 canonical

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 bb_page_limit

  data_type: 'integer'
  default_value: 1000
  is_nullable: 0

=head2 tex

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 pdf

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 a4_pdf

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 lt_pdf

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 html

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 bare_html

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 epub

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 zip

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 ttdir

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 1024

=head2 papersize

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 division

  data_type: 'integer'
  default_value: 12
  is_nullable: 0

=head2 bcor

  data_type: 'varchar'
  default_value: '0mm'
  is_nullable: 0
  size: 16

=head2 fontsize

  data_type: 'integer'
  default_value: 10
  is_nullable: 0

=head2 mainfont

  data_type: 'varchar'
  default_value: 'Linux Libertine O'
  is_nullable: 0
  size: 255

=head2 twoside

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "varchar", is_nullable => 0, size => 8 },
  "mode",
  {
    data_type => "varchar",
    default_value => "blog",
    is_nullable => 0,
    size => 16,
  },
  "locale",
  { data_type => "varchar", default_value => "en", is_nullable => 0, size => 3 },
  "sitename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "siteslogan",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "theme",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "logo",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "mail",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "canonical",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "bb_page_limit",
  { data_type => "integer", default_value => 1000, is_nullable => 0 },
  "tex",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "pdf",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "a4_pdf",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "lt_pdf",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "html",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "bare_html",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "epub",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "zip",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "ttdir",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 1024 },
  "papersize",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "division",
  { data_type => "integer", default_value => 12, is_nullable => 0 },
  "bcor",
  {
    data_type => "varchar",
    default_value => "0mm",
    is_nullable => 0,
    size => 16,
  },
  "fontsize",
  { data_type => "integer", default_value => 10, is_nullable => 0 },
  "mainfont",
  {
    data_type => "varchar",
    default_value => "Linux Libertine O",
    is_nullable => 0,
    size => 255,
  },
  "twoside",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 attachments

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::Attachment>

=cut

__PACKAGE__->has_many(
  "attachments",
  "AmuseWikiFarm::Schema::Result::Attachment",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 categories

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::Category>

=cut

__PACKAGE__->has_many(
  "categories",
  "AmuseWikiFarm::Schema::Result::Category",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 jobs

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::Job>

=cut

__PACKAGE__->has_many(
  "jobs",
  "AmuseWikiFarm::Schema::Result::Job",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 pages

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::Page>

=cut

__PACKAGE__->has_many(
  "pages",
  "AmuseWikiFarm::Schema::Result::Page",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 revisions

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::Revision>

=cut

__PACKAGE__->has_many(
  "revisions",
  "AmuseWikiFarm::Schema::Result::Revision",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 titles

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::Title>

=cut

__PACKAGE__->has_many(
  "titles",
  "AmuseWikiFarm::Schema::Result::Title",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::User>

=cut

__PACKAGE__->has_many(
  "users",
  "AmuseWikiFarm::Schema::Result::User",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vhosts

Type: has_many

Related object: L<AmuseWikiFarm::Schema::Result::Vhost>

=cut

__PACKAGE__->has_many(
  "vhosts",
  "AmuseWikiFarm::Schema::Result::Vhost",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-03-29 11:17:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8pAkH09jlf2f5e2MkjA2Mw

use File::Spec;
use AmuseWikiFarm::Utils::Amuse qw/muse_get_full_path
                                   muse_naming_algo/;

=head2 repo_root_rel

The location of the repository. It's hardcoded as 'repo/<id>'
according to the system path separator. You have no reason to change
this.

=head2 repo_root

The absolute location of the repository. Keep in mind that the
absolute location is inferred with C<getcwd()> + C<repo_name>, so it's
not safe to change directory and call this method.

You can provide an optional argument to get the base (absolute or
relative to the CWD).

=cut

sub repo_root_rel {
    my $self = shift;
    return File::Spec->catdir(repo => $self->id);
}

sub repo_root {
    my ($self, $base) = @_;
    unless (defined $base) {
        $base = '';
    }
    return File::Spec->rel2abs($self->repo_root_rel, $base);
}

=head2 compile_options

Options to feed the Text::Amuse::Compile object.

=head2 compile_extra_options

Options to feed the extra key of the Text::Amuse::Compile object.

=head2 available_formats

Return a list of format => enable pairs.

=head2 available_text_exts

As above, but instead of the compiler options, list the extensions.

=cut

sub compile_options {
    my $self = shift;
    my %opts = $self->available_formats;

    if (my $dir = $self->ttdir) {
        $opts{ttdir} = $dir;
    }
    my %extra;
    foreach my $ext (qw/sitename siteslogan logo
                        papersize division fontsize
                        bcor mainfont twoside/) {
        $opts{extra}{$ext} = $self->$ext;
    }
    $opts{extra}{site} = $self->canonical;
    return %opts;
}

sub available_formats {
    my $self = shift;
    my %formats;
    foreach my $f (qw/tex pdf a4_pdf lt_pdf html bare_html epub zip/) {
        $formats{$f} = $self->$f;
    }
    return %formats;
}

sub available_text_exts {
    my $self = shift;
    my %formats = $self->available_formats;
    my %exts;
    foreach my $k (keys %formats) {
        my $ext = $k;
        $ext =~ s/_/./g;
        $ext = '.' . $ext;
        $exts{$ext} = $formats{$k};
    }
    return %exts;
}

sub known_langs {
    my $self = shift;
    return { ru => 'Русский',
             sr => 'Srpski',
             hr => 'Hrvatski',
             mk => 'Македонски',
             fi => 'Suomi',
             es => 'Español',
             en => 'English',
           };
}


sub path_for_file {
    my ($self, $uri) = @_;
    return unless $uri;
    my $pieces = muse_get_full_path($uri);
    return unless $pieces && @$pieces && @$pieces == 3;

    # add the path piece by piece
    my $target_dir = File::Spec->catdir($self->repo_root, $pieces->[0]);
    unless (-d $target_dir) {
        mkdir $target_dir or die $!;
    }
    $target_dir = File::Spec->catdir($self->repo_root,
                                     $pieces->[0], $pieces->[1]);
    unless (-d $target_dir) {
        mkdir $target_dir or die $!;
    }
    return $target_dir;
}


__PACKAGE__->meta->make_immutable;
1;
