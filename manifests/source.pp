# == definition fluentd::source
define fluentd::source (
    $configfile,
    $type,
    $tag          = false,
    $format       = false,
    $time_format  = false,
    $config       = {},
    $pattern      = [],
    $order        = undef,
) {

    concat::fragment { "source_${title}":
        target  => "/etc/td-agent/config.d/${configfile}.conf",
        require => Package["${fluentd::package_name}"],
        content => template('fluentd/source.erb'),
        order   => $order,
    }
}
