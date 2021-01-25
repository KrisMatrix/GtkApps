#!/usr/bin/perl
use warnings;
use strict;
use Gtk3 '-init';

sub quit_function() {
  print "Exiting Gtk3\n";
  Gtk3->main_quit;
  return 0;
}

my $window = Gtk3::Window->new('toplevel');
$window->set_title("My Title");
$window->set_position("center");
$window->set_default_size(400,50);
$window->set_border_width(20);

$window->signal_connect(delete_event => \&quit_function);

my $btn1 = Gtk3::Button->new("Quit");
$btn1->signal_connect(clicked => \&quit_function);
my $btn2 = Gtk3::Button->new("Another Quit");
$btn2->signal_connect(clicked => \&quit_function);

my $hbox = Gtk3::Box->new("horizontal", 5); #stack items in the box horizontally
                                            # and second param is the spacing
                                            # b/w widgets in pixels
#pack_start(buttonVar,expand,fill,padding)
# buttonVar
# expand: expand the container to make space for button
# fill: the extra space created by the expand option is allocated to the widgets
#         and not just filled with padding
# padding: An extra number of pixels to add b/w widgets to create some space.
$hbox->pack_start($btn1, 1, 1, 0);
$hbox->pack_start($btn2, 1, 1, 0);
$hbox->set_homogeneous(1);  #allocate same amount of space to each widget
$window->add($hbox);
$window->show_all;
Gtk3->main;

#EOF
