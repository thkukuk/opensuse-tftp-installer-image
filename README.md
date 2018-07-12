How to use the openSUSE installer container images
==================================================

There are two images:
* opensuse-tftp-installer - this image only contains a tftp daemon, the DHCP server needs to point to this server. This container image only needs port 69 forwarding.
* opensuse-pxe-server - this image uses dnsmasq as PXE server, no changes to an existing DHCP server are necessary. This container image needs full access to the host network.

= openSUSE tftp installer =

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

= openSUSE PXE Server =

Pull the newest container image from the opensuse registry:

    docker pull registry.opensuse.org/home/kukuk/container/container/kukuk/opensuse-pxe-server:20180710

or from docker hub:

    docker pull thkukuk/opensuse-pxe-server

Run the container image:

    docker run -d --net=host registry.opensuse.org/home/kukuk/container/container/kukuk/opensuse-tftp-installer:20180710 <local IP>

or

    docker run -d --net=host thkukuk/opensuse-tftp-installer <local IP>

