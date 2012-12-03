# Define: apache::vhost::include::rewrite
#
define apache::vhost::include::env (
  $vhost_name,
  $value,
  $priority = 10,
  $template = 'apache/vhost-include-env.include.erb') {
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
