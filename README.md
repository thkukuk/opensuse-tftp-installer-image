How to use the openSUSE tftp installer container image
======================================================

Pull the container image from the opensuse registry:

    docker pull registry.opensuse.org/home/kukuk/container/container/kukuk/opensuse-tftp-installer:20180710

Run the container image:

    docker run -d -p 69:69/udp registry.opensuse.org/home/kukuk/container/container/kukuk/opensuse-tftp-installer:20180710

Configure your dhcp server to point to the host running the container.
If there is a firewall in between, load the 'nf_conntrack_tftp' and
'nf_nat_tftp' module.

To run the container in a kubernetes cluster like SUSE CaaS Platform:

    kubectl create -f pods/opensuse-installer.yaml
