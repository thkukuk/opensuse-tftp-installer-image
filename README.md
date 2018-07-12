How to use the openSUSE tftp installer container image
======================================================

Pull the newest container image from the opensuse registry:

    docker pull registry.opensuse.org/home/kukuk/container/container/kukuk/opensuse-tftp-installer:20180710

or from docker hub:

    docker pull thkukuk/opensuse-tftp-installer

Run the container image:

    docker run -d -p 69:69/udp registry.opensuse.org/home/kukuk/container/container/kukuk/opensuse-tftp-installer:20180710

    or

    docker run -d -p 69:69/udp thkukuk/opensuse-tftp-installer

Configure your dhcp server to point to the host running the container.
If there is a firewall in between, load the 'nf_conntrack_tftp' and
'nf_nat_tftp' module.

To run the container in a kubernetes cluster like SUSE CaaS Platform:

    kubectl create -f https://raw.githubusercontent.com/thkukuk/opensuse-tftp-installer-image/master/pods/opensuse-tftp-installer.yaml
