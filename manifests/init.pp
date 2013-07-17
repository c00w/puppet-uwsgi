class uwsgi {

    Package {
        ensure  => latest
    }

    package {
        "python-pip";
        "python-dev";
        "uWSGI":
            provider    => "pip";

    }

    package {"uWSGI":
        provider => "pip",
        ensure  => latest,
    }

    file {"/etc/init/uwsgi.conf":
        ensure  => present,
        source  => "puppet:///modules/uwsi/init/uwsgi.conf"
    }

    service {"uwsgi":
        require => [
            Package["uWSGI"],
            File["/etc/init/uwsgi.conf"]
        ],
        ensure  => running,
        enable  => true,
    }

    Package["python-pip"] -> Package["uWSGI"]
}
