
use strict;
use warnings;
use Module::Build;
my $build_class = 'Module::Build';
my $custom_build = 'Module::Build::Live';
eval("require $custom_build;");
unless($@) {
  warn "using custom build class:  '$custom_build'\n";
  $build_class = $custom_build;
}

my $builder = $build_class->new(
  module_name         => 'Module::Finder',
  license             => 'perl',
  dist_version_from   => 'lib/Module/Finder.pm',
  requires => {
    'Module::Build' => 0.26,
    'Test::More'    => 0,
  },
  add_to_cleanup      => [ qw(Module-Finder-* META.yml)],
);

$builder->create_build_script();

# vi:syntax=perl:ts=2:sw=2:et:sta
