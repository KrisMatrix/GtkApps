#!/usr/bin/perl
use warnings;
use strict;
use Gtk3 '-init';

my $window = Gtk3::Window->new('toplevel');
$window->set_title("My Title");
$window->set_position("center");
$window->set_default_size(400,300);
$window->set_border_width(20);

$window->signal_connect(delete_event => sub {
  Gtk3->main_quit
});
$window->show_all;
Gtk3->main;
