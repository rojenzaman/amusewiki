package AmuseWikiFarm::Controller::Federation;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

use AmuseWikiFarm::Log::Contextual;
use Data::Dumper::Concise;
use AmuseWikiFarm::Utils::Amuse qw/build_full_uri/;

=head1 NAME

AmuseWikiFarm::Controller::Federation - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub root :Chained('/site_user_required') :PathPart('federation') :CaptureArgs(0) {
    my ($self, $c) = @_;
    unless ($c->check_any_user_role(qw/admin root/)) {
        $c->detach('/not_permitted');
        return;
    }
}

sub sources :Chained('root') :PathPart('sources') :CaptureArgs(0) {
    my ($self, $c) = @_;
    my $rs = $c->stash->{site}->mirror_origins;
    $c->stash(origins_rs => $rs);
}

sub show :Chained('sources') :PathPart('') :Args(0) {
    my ($self, $c) = @_;
    my $origins = [ $c->stash->{origins_rs}->all ];
    $c->stash(origins => $origins);
    # Dlog_debug { "Origins: $_" } $origins;
}

sub edit :Chained('sources') :PathPart('edit') :Args(0) {
    my ($self, $c) = @_;
    my %params = %{ $c->request->body_parameters };
    Dlog_debug { "Params: $_" } \%params;
    my $rs = $c->stash->{origins_rs};
    if ($params{create} && $params{remote_domain} && $params{remote_path}) {
        $rs->create({
                     remote_domain => $params{remote_domain},
                     remote_path => $params{remote_path},
                    });
        $c->res->redirect($c->uri_for_action('/federation/show'));
        return;
    }
    my %out;
    if (my $edit = $params{toggle}) {
        if (my $origin = $rs->find($edit)) {
            $origin->update({ active => $origin->active ? 0 : 1 });
            $out{toggled} = $edit;
        }
        else {
            $out{error} = "$edit not found";
        }
    }
    $c->stash(json => \%out);
    $c->detach($c->view('JSON'));
}

sub single :Chained('sources') :PathPart('') :CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    if (my $origin = $c->stash->{origins_rs}->find($id)) {
        $c->stash(mirror_origin => $origin);
    }
    else {
        $c->detach('/not_found');        
    }
}

sub details :Chained('single') :PathPart('details') :Args(0) {
    my ($self, $c) = @_;
    my $origin = $c->stash->{mirror_origin};
    my @entries = $origin->mirror_infos->search(undef, { prefetch => [qw/title attachment/] })->hri->all;
    foreach my $entry (@entries) {
        if (my $title = delete $entry->{title}) {
            $title->{class} = 'Title';
            $entry->{full_uri} = build_full_uri($title);
        }
        elsif (my $att = delete $entry->{attachment}) {
            $att->{class} = 'Attachment';
            $entry->{full_uri} = build_full_uri($att);
        }
    }
    Dlog_debug { "$_" } \@entries;
    $c->stash(
              mirror_entries => \@entries,
              mirror_origin => { $origin->get_columns },
              load_datatables => 1,
             );
}

sub check :Chained('single') :PathPart('check') :Args(0) {
    my ($self, $c) = @_;
    my $origin = $c->stash->{mirror_origin};
    my $res = $origin->fetch_remote;
    $c->stash(json => $res);
    $c->detach($c->view('JSON'));
}

sub fetch :Chained('single') :PathPart('fetch') :Args(0) {
    my ($self, $c) = @_;
    my $origin = $c->stash->{mirror_origin};
    my $err;
    if (my $res = $origin->fetch_remote) {
        if (my $list = $res->{data}) {
            # unclear if too slow and requiring a job
            my $job = $origin->prepare_download($list);
            $c->response->redirect($c->uri_for_action('/tasks/show_bulk_job', [ $job->bulk_job_id ]));
            return;
        }
        else {
            $err = $res->{error} || "No data"
        }
    }
    else {
        die "Shouldn't happen";
    }
    $c->flash(error_msg => $c->loc("Failure: $err"));
    $c->response->redirect($c->uri_for_action('federation/show'));
}

=encoding utf8

=head1 AUTHOR

Marco,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
