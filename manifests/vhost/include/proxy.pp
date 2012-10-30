# Define: apache::vhost::include::proxy
#
# Configures a Location include of a proxy vhost
#
# Parameters:
# * $proxy_vhost:
#     Name of the proxy vhost to configure
# * $location:
#     Location for this prxy to respond to
# * $dest:
#     URI that the requests will be proxied for
# - $priority
# - $template -- the template to use for the include
#
#
define apache::vhost::include::proxy (
    $proxy_vhost,
    $location,
    $dest,
    $priority = '10',
    $url_map = '',
    $template = 'apache/vhost-include-proxy.include.erb'
) {
    file { "${proxy_vhost}-${priority}-${name}.include":
        path   => "${apache::params::vdir}/${proxy_vhost}-${priority}-${name}.include",
        content => template($template),
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => Package['httpd'],
        notify  => Service['httpd'],
    }
}
