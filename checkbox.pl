#!/usr/bin/perl
use warnings;
use strict;
use Gtk3 '-init';

my $window = Gtk3::Window->new('toplevel');
$window->set_title("Basic Check Boxes");
$window->set_position("mouse");
$window->set_default_size(200,100);
$window->set_border_width(5);

$window->signal_connect(delete_event => \&quit_function);

my $vbox = Gtk3::Box->new("vertical", 5);
$window->add($vbox);

my $entry = Gtk3::Entry->new;
$entry->set_text("Hello World");
$vbox->pack_start($entry,1,1,0);

my $hbox = Gtk3::Box->new("horizontal", 6); #stack items in the box horizontally
# and second param is the spacing
# b/w widgets in pixels
$vbox->pack_start($hbox,1,1,0);

my $btn1 = Gtk3::CheckButton->new_with_label("Editable");
$btn1->signal_connect(toggler => \&cb_toggled, "editable");
$btn1->set_active(1);
$hbox->pack_start($btn1,1,1,0);

my $btn2 = Gtk3::CheckButton->new_with_label("Visible");
$btn2->signal_connect(toggler => \&cb_toggled, "visible");
$btn2->set_active(1);
$hbox->pack_start($btn2,1,1,0);

my $btn3 = Gtk3::CheckButton->new_with_label("Icon");
$btn3->signal_connect(toggler => \&cb_toggled, "icon");
$btn3->set_active(0);
$hbox->pack_start($btn3,1,1,0);

$window->show_all;
Gtk3->main;

sub cb_toggled() {
  my ($widget, $data) = @_;
  my $value = $widget->get_active;
  if ($data eq "visible") {
    $entry->set_visibility($value);
  }
  elsif ($data eq "editable") {
    $entry->set_editable($value);
  }
  elsif ($data eq "icon") {
    my $stock_id = undef;
    if ($value == 1) {
      $stock_id = Gtk3::STOCK_FIND;
    }
    $entry->set_icon_from_stock("secondary", $stock_id);
  }
  return 0;
}

sub quit_function() {
  #print "Exiting Gtk3\n";
  Gtk3->main_quit;
  return 0;
}

#EOF
