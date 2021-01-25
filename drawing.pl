#!/usr/bin/perl
use warnings;
use strict;
use Gtk3 '-init';
use Cairo::GObject;
use constant PI => 3.1415927;

my $window = Gtk3::Window->new("toplevel");
$window->set_title("Cairo Basics");
$window->set_position("mouse");
$window->set_default_size(600,400);
$window->set_border_width(5);
$window->signal_connect(delete_event => sub {
  Gtk3->main_quit;
});

my $frame = Gtk3::Frame->new("Cairo Drawings");
$window->add($frame);

my $drawable = Gtk3::DrawingArea->new;
$drawable->signal_connect(draw => \&cairo_draw);
$frame->add($drawable);

$window->show_all;

Gtk3->main;

sub cairo_draw() {
  my ($widget, $context, $ref_status) = @_;

  #Background
  $context->set_source_rgb(0.9, 0.9, 0.7);
  $context->paint;

  #Solid Box
  $context->set_source_rgb(0.6, 0.0, 0.0);
  $context->set_line_width(10);
  $context->rectangle(5, 5, 160, 130);
  $context->stroke;

  #Transparent Rectangle
  $context->set_source_rgba(0.0, 0.7, 0.0, 0.5);
  $context->set_line_width(10);
  $context->rectangle(85, 85, 160, 230);
  $context->fill;

  #Circle with border - transparent
  $context->set_source_rgba(0.0, 0.0, 0.9, 0.5);
  $context->arc(220, 150, 100, 0, PI*2);
  $context->set_line_width(10);
  $context->stroke_preserve;
  $context->set_source_rgba(0.9, 0.2, 0.2, 0.2);
  $context->fill;

  return 0;
}
