class uwsgi {

    Package {
        ensure  => latest
    }

    package {
        "python-dev":
            ;
        "uWSGI":
            provider    => "pip";
    }

    file {"/etc/init/uwsgi.conf":
        ensure  => present,
        source  => "puppet:///modules/uwsgi/init/uwsgi.conf"
    }

    service {"uwsgi":
        require => [
            Package["uWSGI"],
            File["/etc/init/uwsgi.conf"]
        ],
        ensure  => running,
        enable  => true,
    }
}
