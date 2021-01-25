#!/usr/bin/perl
use strict;
use warnings;
use Gtk3 '-init';

my $window = Gtk3::Window->new('toplevel');
$window->signal_connect(delete_event => sub {
  Gtk3->main_quit
});
$window->show_all;
Gtk3->main;
