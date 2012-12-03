# Define: apache::vhost::include::php
#
define apache::vhost::include::php (
  $vhost_name,
  $values,
  $priority = 10,
  $template = 'apache/vhost-include-php.include.erb') {
  file { "${vhost_name}-${priority}-${name}.include":
    path    => "${apache::params::vdir}/${vhost_name}-${priority}-${name}.include",
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
}
