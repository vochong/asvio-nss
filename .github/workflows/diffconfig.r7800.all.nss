# Netgear R7800 ath10k NSS

CONFIG_TARGET_ipq806x=y
CONFIG_TARGET_ipq806x_generic=y
CONFIG_TARGET_ipq806x_generic_DEVICE_netgear_r7800=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_netgear_r7800="-kmod-ath10k-ct -ath10k-firmware-qca9984-ct kmod-ath10k ath10k-firmware-qca9984"

# ath10k driver and firmware
CONFIG_PACKAGE_kmod-ath10k=y
CONFIG_PACKAGE_ath10k-firmware-qca9984=y
# CONFIG_PACKAGE_kmod-ath10k-ct is not set
# CONFIG_PACKAGE_ath10k-firmware-qca9984-ct is not set

CONFIG_KERNEL_BUILD_DOMAIN="openwrt.lan"
CONFIG_KERNEL_BUILD_USER="Netgear_r7800_ath10k_nss"

CONFIG_BUILD_PATENTED=y
CONFIG_PACKAGE_kmod-ikconfig=y

CONFIG_EXPERIMENTAL=y
CONFIG_ATH10K_LEDS=y
CONFIG_ATH10K_THERMAL=y

CONFIG_FEED_sqm_scripts_nss=n

# NSS Drivers
CONFIG_PACKAGE_kmod-nss-ifb=y
CONFIG_PACKAGE_kmod-qca-mcs=y
CONFIG_PACKAGE_kmod-qca-nss-cfi-cryptoapi=y
CONFIG_PACKAGE_kmod-qca-nss-crypto=y
CONFIG_PACKAGE_kmod-qca-nss-drv=y
CONFIG_PACKAGE_kmod-qca-nss-drv-igs=y
CONFIG_PACKAGE_kmod-qca-nss-drv-l2tpv2=y
CONFIG_PACKAGE_kmod-qca-nss-drv-pppoe=y
CONFIG_PACKAGE_kmod-qca-nss-drv-pptp=y
CONFIG_PACKAGE_kmod-qca-nss-drv-qdisc=y
CONFIG_PACKAGE_kmod-qca-nss-drv-tun6rd=y
CONFIG_PACKAGE_kmod-qca-nss-drv-tunipip6=y
CONFIG_PACKAGE_kmod-qca-nss-gmac=y
CONFIG_PACKAGE_kmod-qca-nss-ecm-standard=y
CONFIG_PACKAGE_kmod-qca-nss-drv-netlink=y
CONFIG_PACKAGE_kmod-qca-nss-drv-profile=y
CONFIG_PACKAGE_MAC80211_NSS_SUPPORT=y
CONFIG_PACKAGE_MAC80211_DEBUGFS=y

# SQM QoS nss
CONFIG_PACKAGE_sqm-scripts-nss=y


#####################################################################
# SSL Configuration
#####################################################################
# Use OpenSSL as the preferred SSL library
CONFIG_PACKAGE_libustream-openssl=y
CONFIG_PACKAGE_libustream-mbedtls=n
CONFIG_PACKAGE_libopenssl=y
CONFIG_LUA_ECO_OPENSSL=y
CONFIG_LUA_ECO_MBEDTLS=n
# Optimize OpenSSL for speed over size
CONFIG_OPENSSL_OPTIMIZE_SPEED=y

#####################################################################
# Wireless Configuration
#####################################################################
# Enable WPA3 and Mesh support
CONFIG_PACKAGE_wpad-mesh-openssl=y
# Avoid using mbedTLS for consistency across packages and to avoid mixed SSL libraries.
CONFIG_PACKAGE_wpad-basic-mbedtls=n

#####################################################################
# Library Optimization
#####################################################################
# Optimize common libraries (zlib, zstd) for speed, improving performance on compression tasks.
CONFIG_ZLIB_OPTIMIZE_SPEED=y
CONFIG_ZSTD_OPTIMIZE_O3=y

#####################################################################
# Feeds Configuration
#####################################################################
# Prevent package manager from adding custom feeds as repositories in final image.
# They don't exist upstream and will cause errors when trying to update
CONFIG_FEED_nss_packages=n
CONFIG_FEED_sqm_scripts_nss=n

# --- Essential Packages ---

#####################################################################
# LUCI (the web interface)
#####################################################################
CONFIG_PACKAGE_luci=y
# Enable HTTPS support
CONFIG_PACKAGE_luci-ssl-openssl=y
# LUCI theme
CONFIG_PACKAGE_luci-theme-material=y

#####################################################################
# LUCI Applications
#####################################################################
# - Firewall: Manage firewall rules via LUCI.
CONFIG_PACKAGE_luci-app-firewall=y
# - Package manager for OpenWRT, manage installed packages via LUCI.
CONFIG_PACKAGE_luci-app-package-manager=y

# - iperf3: CLI tool to measure network performance.
#           This is essential to test WiFi speeds,
#           as posting speedtest.net results is useless
#           without knowing the network conditions.
CONFIG_PACKAGE_iperf3=y

# --- Optional Packages --- #

#### EVERYTHING BELOW THIS SECTION IS OPTIONAL!!

#### You can delete or comment out with '#' any package you don't want to install.

#####################################################################
# LUCI Applications
#####################################################################

# - SQM: Smart Queue Management for bufferbloat control.
CONFIG_PACKAGE_luci-app-sqm=y
# - Statistics: Monitor your router’s performance (CPU, memory, bandwidth).
CONFIG_PACKAGE_luci-app-statistics=y
# - ACME: Automated SSL cert management. If you want to access your router via HTTPS and have a domain.
CONFIG_PACKAGE_luci-app-acme=y
# - Watchcat: Automate reboots on connection loss.
CONFIG_PACKAGE_luci-app-watchcat=y
# - WireGuard: VPN support. Will also select the kernel module.
CONFIG_PACKAGE_luci-proto-wireguard=y
# - NLBWMon: Network usage monitoring to track bandwidth by host.
CONFIG_PACKAGE_luci-app-nlbwmon=y

#####################################################################
# Kernel Modules
#####################################################################
# Filesystem support for USB storage:
# FAT32: Useful to load recovery or new images that can be booted by u-boot
CONFIG_PACKAGE_kmod-fs-vfat=y
# NTFS: Mostly useful for Windows users.
CONFIG_PACKAGE_kmod-fs-ntfs3=y

# Network
# Bridge module support for working with nftables for more complex firewall setups.
CONFIG_PACKAGE_kmod-nft-bridge=y

# USB Storage
CONFIG_PACKAGE_kmod-usb-storage=y

# Logging/Debugging

# ramoops: kernel module that logs crashes to RAM which can be read after a reboot.
# Check '/sys/fs/pstore' for logs after a crash.
CONFIG_PACKAGE_kmod-ramoops=y

#####################################################################
# Packages
#####################################################################

# - curl: CLI tool to transfer data with URLs. Useful for scripting, and supperior to wget.
CONFIG_PACKAGE_curl=y
CONFIG_LIBCURL_OPENSSL=y
CONFIG_LIBCURL_MBEDTLS=n
# - tcpdump: Capture and analyze network traffic.
CONFIG_PACKAGE_tcpdump=y
# - htop: CLI tool to monitor system resource usage.
CONFIG_PACKAGE_htop=y
# lm-sensors isn't needed for IPQ807x devices.
CONFIG_HTOP_LMSENSORS=n


#####################################################################
# My Additional Packages
#####################################################################
# Busybox tweaks
CONFIG_BUSYBOX_CUSTOM=y
CONFIG_BUSYBOX_DEFAULT_TELNET=y
CONFIG_BUSYBOX_CONFIG_TELNET=y
CONFIG_BUSYBOX_CONFIG_FEATURE_TELNET_TTYPE=y
CONFIG_BUSYBOX_CONFIG_FEATURE_TELNET_AUTOLOGIN=y
CONFIG_BUSYBOX_CONFIG_FEATURE_TELNET_WIDTH=y
CONFIG_BUSYBOX_CONFIG_FEATURE_EDITING_SAVEHISTORY=y
CONFIG_BUSYBOX_CONFIG_FEATURE_EDITING_SAVE_ON_EXIT=y
CONFIG_BUSYBOX_CONFIG_FEATURE_LESS_FLAGS=y
CONFIG_BUSYBOX_CONFIG_FEATURE_LESS_REGEXP=y
CONFIG_BUSYBOX_CONFIG_FEATURE_LESS_WINCH=y

# Luci Apps
CONFIG_PACKAGE_luci-app-acl=y
CONFIG_PACKAGE_luci-app-banip=y
CONFIG_PACKAGE_luci-app-commands=y
CONFIG_PACKAGE_luci-app-firewall=y
CONFIG_PACKAGE_luci-app-ksmbd=y
CONFIG_PACKAGE_luci-app-ser2net=y
CONFIG_PACKAGE_luci-app-sshtunnel=y
CONFIG_PACKAGE_luci-app-statistics=y
CONFIG_PACKAGE_luci-app-tinyproxy=y
CONFIG_PACKAGE_luci-app-travelmate=y
CONFIG_PACKAGE_luci-app-vnstat2=y
CONFIG_PACKAGE_luci-app-wifischedule=y
CONFIG_PACKAGE_luci-app-wol=y
CONFIG_PACKAGE_luci-app-advanced-reboot=y
CONFIG_PACKAGE_luci-proto-relay=y
CONFIG_PACKAGE_luci-app-lldpd=y
CONFIG_PACKAGE_luci-app-snmpd=y
CONFIG_PACKAGE_ca-certificates=y

# Add-on programs
CONFIG_DROPBEAR_ECC=y
CONFIG_PACKAGE_kmod-cryptodev=y
CONFIG_PACKAGE_libopenssl-devcrypto=y
CONFIG_PACKAGE_kmod-dnsresolver=y
CONFIG_PACKAGE_kmod-ramoops=y
CONFIG_PACKAGE_kmod-pstore=y
CONFIG_PACKAGE_kmod-reed-solomon=y

# USB device mount & file systems support
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_cryptsetup=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_kmod-crypto-ecb=y
CONFIG_PACKAGE_kmod-crypto-iv=y
CONFIG_PACKAGE_kmod-crypto-misc=y
CONFIG_PACKAGE_kmod-crypto-user=y
CONFIG_PACKAGE_kmod-crypto-xts=y
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-f2fs=y
CONFIG_PACKAGE_kmod-fs-hfs=y
CONFIG_PACKAGE_kmod-fs-hfsplus=y
CONFIG_PACKAGE_kmod-fs-msdos=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
CONFIG_PACKAGE_kmod-nls-base=y
CONFIG_PACKAGE_kmod-nls-cp1250=y
CONFIG_PACKAGE_kmod-nls-cp437=y
CONFIG_PACKAGE_kmod-nls-cp850=y
CONFIG_PACKAGE_kmod-nls-iso8859-1=y
CONFIG_PACKAGE_kmod-nls-iso8859-15=y
CONFIG_PACKAGE_kmod-nls-utf8=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_libblkid=y
CONFIG_PACKAGE_nfs-utils=y
CONFIG_PACKAGE_ntfs-3g=y

# IPv6 support
CONFIG_PACKAGE_ds-lite=y
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_6to4=y
CONFIG_PACKAGE_6rd=y

# Tools 
CONFIG_PACKAGE_bind-dig=y
CONFIG_PACKAGE_conntrack=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_eapol-test-openssl=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_iftop=y
CONFIG_PACKAGE_iperf3=y
CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_lftp=y
CONFIG_PACKAGE_msmtp=y
CONFIG_PACKAGE_mtr-json=y
CONFIG_PACKAGE_ncat=y
CONFIG_PACKAGE_net-tools-netstat=y
CONFIG_PACKAGE_ntpdate=y
CONFIG_PACKAGE_nmap=y
CONFIG_PACKAGE_openssh-client=y
CONFIG_PACKAGE_openssh-sftp-client=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_picocom=y
CONFIG_PACKAGE_qrencode=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_ser2net=y
CONFIG_PACKAGE_socat=y
CONFIG_PACKAGE_ss=y
CONFIG_PACKAGE_tcpdump=y
CONFIG_PACKAGE_tc-full=y
CONFIG_PACKAGE_tinyproxy=y
CONFIG_PACKAGE_vsftpd=y
CONFIG_PACKAGE_whois=y
CONFIG_PACKAGE_wget-ssl=y
CONFIG_PACKAGE_speedtest-go=y
CONFIG_PACKAGE_ethtool=y

# Travelmate
CONFIG_PACKAGE_luci-app-travelmate=y
CONFIG_PACKAGE_travelmate=y

# Wireguard
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_kmod-wireguard=y
CONFIG_PACKAGE_luci-proto-wireguard=y
CONFIG_PACKAGE_wireguard-tools=y
CONFIG_PACKAGE_rpcd-mod-wireguard=y

# Strongswan
CONFIG_PACKAGE_ip-full=y
CONFIG_PACKAGE_kmod-crypto-acompress=y
CONFIG_PACKAGE_kmod-crypto-authenc=y
CONFIG_PACKAGE_kmod-crypto-cbc=y
CONFIG_PACKAGE_kmod-crypto-deflate=y
CONFIG_PACKAGE_kmod-crypto-des=y
CONFIG_PACKAGE_kmod-crypto-echainiv=y
CONFIG_PACKAGE_kmod-crypto-md5=y
CONFIG_PACKAGE_kmod-crypto-sha1=y
CONFIG_PACKAGE_kmod-ipsec=y
CONFIG_PACKAGE_kmod-ipsec4=y
CONFIG_PACKAGE_kmod-ipsec6=y
CONFIG_PACKAGE_kmod-iptunnel4=y
CONFIG_PACKAGE_kmod-iptunnel6=y
CONFIG_PACKAGE_kmod-lib-zlib-deflate=y
CONFIG_PACKAGE_kmod-lib-zlib-inflate=y
CONFIG_PACKAGE_strongswan=y
CONFIG_PACKAGE_strongswan-charon=y
CONFIG_PACKAGE_strongswan-charon-cmd=y
CONFIG_PACKAGE_strongswan-default=y
CONFIG_PACKAGE_strongswan-ipsec=y
CONFIG_PACKAGE_strongswan-isakmp=y
CONFIG_PACKAGE_strongswan-libnttfft=y
CONFIG_PACKAGE_strongswan-libtls=y
CONFIG_PACKAGE_strongswan-mod-addrblock=y
CONFIG_PACKAGE_strongswan-mod-aes=y
CONFIG_PACKAGE_strongswan-mod-af-alg=y
CONFIG_PACKAGE_strongswan-mod-agent=y
CONFIG_PACKAGE_strongswan-mod-attr=y
CONFIG_PACKAGE_strongswan-mod-attr-sql=y
CONFIG_PACKAGE_strongswan-mod-bliss=y
CONFIG_PACKAGE_strongswan-mod-blowfish=y
CONFIG_PACKAGE_strongswan-mod-ccm=y
CONFIG_PACKAGE_strongswan-mod-chapoly=y
CONFIG_PACKAGE_strongswan-mod-cmac=y
CONFIG_PACKAGE_strongswan-mod-connmark=y
CONFIG_PACKAGE_strongswan-mod-constraints=y
CONFIG_PACKAGE_strongswan-mod-coupling=y
CONFIG_PACKAGE_strongswan-mod-ctr=y
CONFIG_PACKAGE_strongswan-mod-curl=y
CONFIG_PACKAGE_strongswan-mod-curve25519=y
CONFIG_PACKAGE_strongswan-mod-des=y
CONFIG_PACKAGE_strongswan-mod-dhcp=y
CONFIG_PACKAGE_strongswan-mod-dnskey=y
CONFIG_PACKAGE_strongswan-mod-drbg=y
CONFIG_PACKAGE_strongswan-mod-duplicheck=y
CONFIG_PACKAGE_strongswan-mod-eap-dynamic=y
CONFIG_PACKAGE_strongswan-mod-eap-identity=y
CONFIG_PACKAGE_strongswan-mod-eap-md5=y
CONFIG_PACKAGE_strongswan-mod-eap-mschapv2=y
CONFIG_PACKAGE_strongswan-mod-eap-radius=y
CONFIG_PACKAGE_strongswan-mod-eap-tls=y
CONFIG_PACKAGE_strongswan-mod-farp=y
CONFIG_PACKAGE_strongswan-mod-fips-prf=y
CONFIG_PACKAGE_strongswan-mod-forecast=y
CONFIG_PACKAGE_strongswan-mod-gcm=y
CONFIG_PACKAGE_strongswan-mod-gcrypt=y
CONFIG_PACKAGE_strongswan-mod-gmp=y
CONFIG_PACKAGE_strongswan-mod-gmpdh=y
CONFIG_PACKAGE_strongswan-mod-ha=y
CONFIG_PACKAGE_strongswan-mod-hmac=y
CONFIG_PACKAGE_strongswan-mod-kdf=y
CONFIG_PACKAGE_strongswan-mod-kernel-libipsec=y
CONFIG_PACKAGE_strongswan-mod-kernel-netlink=y
CONFIG_PACKAGE_strongswan-mod-ldap=y
CONFIG_PACKAGE_strongswan-mod-led=y
CONFIG_PACKAGE_strongswan-mod-load-tester=y
CONFIG_PACKAGE_strongswan-mod-md4=y
CONFIG_PACKAGE_strongswan-mod-md5=y
CONFIG_PACKAGE_strongswan-mod-mgf1=y
CONFIG_PACKAGE_strongswan-mod-mysql=y
CONFIG_PACKAGE_strongswan-mod-newhope=y
CONFIG_PACKAGE_strongswan-mod-ntru=y
CONFIG_PACKAGE_strongswan-mod-openssl=y
CONFIG_PACKAGE_strongswan-mod-pem=y
CONFIG_PACKAGE_strongswan-mod-pgp=y
CONFIG_PACKAGE_strongswan-mod-pkcs1=y
CONFIG_PACKAGE_strongswan-mod-pkcs11=y
CONFIG_PACKAGE_strongswan-mod-pkcs12=y
CONFIG_PACKAGE_strongswan-mod-pkcs7=y
CONFIG_PACKAGE_strongswan-mod-pkcs8=y
CONFIG_PACKAGE_strongswan-mod-pubkey=y
CONFIG_PACKAGE_strongswan-mod-random=y
CONFIG_PACKAGE_strongswan-mod-rc2=y
CONFIG_PACKAGE_strongswan-mod-resolve=y
CONFIG_PACKAGE_strongswan-mod-revocation=y
CONFIG_PACKAGE_strongswan-mod-sha1=y
CONFIG_PACKAGE_strongswan-mod-sha2=y
CONFIG_PACKAGE_strongswan-mod-sha3=y
CONFIG_PACKAGE_strongswan-mod-smp=y
CONFIG_PACKAGE_strongswan-mod-socket-default=y
CONFIG_PACKAGE_strongswan-mod-socket-dynamic=y
CONFIG_PACKAGE_strongswan-mod-sql=y
CONFIG_PACKAGE_strongswan-mod-sqlite=y
CONFIG_PACKAGE_strongswan-mod-sshkey=y
CONFIG_PACKAGE_strongswan-mod-stroke=y
CONFIG_PACKAGE_strongswan-mod-test-vectors=y
CONFIG_PACKAGE_strongswan-mod-uci=y
CONFIG_PACKAGE_strongswan-mod-unity=y
CONFIG_PACKAGE_strongswan-mod-updown=y
CONFIG_PACKAGE_strongswan-mod-vici=y
CONFIG_PACKAGE_strongswan-mod-whitelist=y
CONFIG_PACKAGE_strongswan-mod-x509=y
CONFIG_PACKAGE_strongswan-mod-xauth-eap=y
CONFIG_PACKAGE_strongswan-mod-xauth-generic=y
CONFIG_PACKAGE_strongswan-mod-xcbc=y
CONFIG_PACKAGE_strongswan-pki=y
CONFIG_PACKAGE_strongswan-swanctl=y
CONFIG_PACKAGE_xl2tpd=y
CONFIG_STRONGSWAN_ROUTING_TABLE="220"
CONFIG_STRONGSWAN_ROUTING_TABLE_PRIO="220"

# OpenVPN
CONFIG_PACKAGE_luci-app-openvpn=y
CONFIG_PACKAGE_collectd-mod=y
CONFIG_PACKAGE_openvpn-openssl=y
CONFIG_PACKAGE_openvpn-easy-rsa=y
CONFIG_OPENSSL_ENGINE=y
CONFIG_OPENSSL_PREFER_CHACHA_OVER_GCM=y
CONFIG_OPENSSL_WITH_ASM=y
CONFIG_OPENSSL_WITH_CHACHA_POLY1305=y
CONFIG_OPENSSL_WITH_CMS=y
CONFIG_OPENSSL_WITH_DEPRECATED=y
CONFIG_OPENSSL_WITH_ERROR_MESSAGES=y
CONFIG_OPENSSL_WITH_IDEA=y
CONFIG_OPENSSL_WITH_MDC2=y
CONFIG_OPENSSL_WITH_PSK=y
CONFIG_OPENSSL_WITH_SEED=y
CONFIG_OPENSSL_WITH_SRP=y
CONFIG_OPENSSL_WITH_TLS13=y
CONFIG_OPENSSL_WITH_WHIRLPOOL=y
CONFIG_OPENVPN_openssl_ENABLE_DCO=y
CONFIG_OPENVPN_openssl_ENABLE_FRAGMENT=y
CONFIG_OPENVPN_openssl_ENABLE_LZ4=y
CONFIG_OPENVPN_openssl_ENABLE_LZO=y
CONFIG_OPENVPN_openssl_ENABLE_PORT_SHARE=y
CONFIG_OPENVPN_openssl_ENABLE_SMALL=y
CONFIG_PACKAGE_kmod-iptunnel=y
CONFIG_PACKAGE_kmod-ovpn-dco-v2=y
CONFIG_PACKAGE_kmod-tun=y
CONFIG_PACKAGE_kmod-udptunnel4=y
CONFIG_PACKAGE_kmod-udptunnel6=y
CONFIG_PACKAGE_libatomic=y
CONFIG_PACKAGE_libcap-ng=y
CONFIG_PACKAGE_liblz4=y
CONFIG_PACKAGE_liblzo=y
CONFIG_PACKAGE_libnl-core=y
CONFIG_PACKAGE_libnl-genl=y
CONFIG_PACKAGE_libopenssl=y

# Extra Kernel Modules
CONFIG_PACKAGE_kmod-gre=y
CONFIG_PACKAGE_kmod-gre6=y
CONFIG_PACKAGE_kmod-mpls=y
CONFIG_PACKAGE_kmod-nat46=y
CONFIG_PACKAGE_vxlan=y
CONFIG_PACKAGE_kmod-vxlan=y
CONFIG_PACKAGE_kmod-macsec=y
CONFIG_PACKAGE_kmod-macvlan=y
CONFIG_PACKAGE_kmod-geneve=y
CONFIG_PACKAGE_kmod-ip6-tunnel=y
CONFIG_PACKAGE_kmod-iptunnel=y
CONFIG_PACKAGE_kmod-iptunnel6=y
CONFIG_PACKAGE_kmod-nf-nathelper=y

# Routing, Multicast
CONFIG_LLDPD_WITH_CDP=y
CONFIG_LLDPD_WITH_CUSTOM=y
CONFIG_LLDPD_WITH_DOT1=y
CONFIG_LLDPD_WITH_DOT3=y
CONFIG_LLDPD_WITH_EDP=y
CONFIG_LLDPD_WITH_FDP=y
CONFIG_LLDPD_WITH_JSON=y
CONFIG_LLDPD_WITH_LLDPMED=y
CONFIG_LLDPD_WITH_PRIVSEP=y
CONFIG_LLDPD_WITH_SNMP=y
CONFIG_LLDPD_WITH_SONMP=y
CONFIG_PACKAGE_bird3=y
CONFIG_PACKAGE_bird3c=y
CONFIG_PACKAGE_bird3cl=y
CONFIG_PACKAGE_igmpproxy=y
CONFIG_PACKAGE_ip-bridge=y

# Shairport Audio
CONFIG_PACKAGE_shairport-sync-openssl=y
CONFIG_PACKAGE_kmod-input-core=y
CONFIG_PACKAGE_kmod-ppdev=y
CONFIG_PACKAGE_kmod-scsi-core=y
CONFIG_PACKAGE_kmod-sound-core=y
CONFIG_GNUTLS_ALPN=y
CONFIG_GNUTLS_ANON=y
CONFIG_GNUTLS_DTLS_SRTP=y
CONFIG_GNUTLS_HEARTBEAT=y
CONFIG_GNUTLS_OCSP=y
CONFIG_GNUTLS_PSK=y
CONFIG_LIBSODIUM_MINIMAL=y
CONFIG_OPENSSL_ENGINE=y
CONFIG_OPENSSL_PREFER_CHACHA_OVER_GCM=y
CONFIG_OPENSSL_WITH_ASM=y
CONFIG_OPENSSL_WITH_CHACHA_POLY1305=y
CONFIG_OPENSSL_WITH_CMS=y
CONFIG_OPENSSL_WITH_DEPRECATED=y
CONFIG_OPENSSL_WITH_ERROR_MESSAGES=y
CONFIG_OPENSSL_WITH_IDEA=y
CONFIG_OPENSSL_WITH_MDC2=y
CONFIG_OPENSSL_WITH_PSK=y
CONFIG_OPENSSL_WITH_SEED=y
CONFIG_OPENSSL_WITH_SRP=y
CONFIG_OPENSSL_WITH_TLS13=y
CONFIG_OPENSSL_WITH_WHIRLPOOL=y
CONFIG_PACKAGE_alsa-lib=y
CONFIG_PACKAGE_avahi-dbus-daemon=y
CONFIG_PACKAGE_dbus=y
CONFIG_PACKAGE_edgeport-firmware=y
CONFIG_PACKAGE_fdk-aac=y
CONFIG_PACKAGE_libatomic=y
CONFIG_PACKAGE_libavahi-client=y
CONFIG_PACKAGE_libavahi-dbus-support=y
CONFIG_PACKAGE_libbz2=y
CONFIG_PACKAGE_libcares=y
CONFIG_PACKAGE_libconfig=y
CONFIG_PACKAGE_libdaemon=y
CONFIG_PACKAGE_libdbus=y
CONFIG_PACKAGE_libexpat=y
CONFIG_PACKAGE_libffmpeg-full=y
CONFIG_PACKAGE_libgcrypt=y
CONFIG_PACKAGE_libgmp=y
CONFIG_PACKAGE_libgnutls=y
CONFIG_PACKAGE_libgpg-error=y
CONFIG_PACKAGE_libmosquitto-ssl=y
CONFIG_PACKAGE_libnettle=y
CONFIG_PACKAGE_libopenssl=y
CONFIG_PACKAGE_libplist=y
CONFIG_PACKAGE_libpopt=y
CONFIG_PACKAGE_librt=y
CONFIG_PACKAGE_libsodium=y
CONFIG_PACKAGE_libsoxr=y
CONFIG_PACKAGE_libuuid=y
CONFIG_PACKAGE_libxml2=y
CONFIG_PACKAGE_nqptp=y
CONFIG_PACKAGE_shine=y

# USB Kernel Modules
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-ark3116=y
CONFIG_PACKAGE_kmod-usb-serial-belkin=y
CONFIG_PACKAGE_kmod-usb-serial-ch341=y
CONFIG_PACKAGE_kmod-usb-serial-cp210x=y
CONFIG_PACKAGE_kmod-usb-serial-cypress-m8=y
CONFIG_PACKAGE_kmod-usb-serial-edgeport=y
CONFIG_PACKAGE_kmod-usb-serial-ftdi=y
CONFIG_PACKAGE_kmod-usb-serial-garmin=y
CONFIG_PACKAGE_kmod-usb-serial-ipw=y
CONFIG_PACKAGE_kmod-usb-serial-keyspan=y
CONFIG_PACKAGE_kmod-usb-serial-mct=y
CONFIG_PACKAGE_kmod-usb-serial-mos7720=y
CONFIG_PACKAGE_kmod-usb-serial-mos7840=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-oti6858=y
CONFIG_PACKAGE_kmod-usb-serial-pl2303=y
CONFIG_PACKAGE_kmod-usb-serial-qualcomm=y
CONFIG_PACKAGE_kmod-usb-serial-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-serial-simple=y
CONFIG_PACKAGE_kmod-usb-serial-ti-usb=y
CONFIG_PACKAGE_kmod-usb-serial-visor=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_kmod-usb-uhci=y

# VTI and XFRM Interfaces
CONFIG_PACKAGE_kmod-ip-vti=y
CONFIG_PACKAGE_kmod-ip6-vti=y
CONFIG_PACKAGE_luci-proto-vti=y
CONFIG_PACKAGE_vti=y

CONFIG_PACKAGE_kmod-nft-xfrm=y
CONFIG_PACKAGE_kmod-xfrm-interface=y
CONFIG_PACKAGE_luci-proto-xfrm=y
CONFIG_PACKAGE_xfrm=y

# FreeRADIUS 3
CONFIG_FREERADIUS3_OPENSSL=y
CONFIG_OPENSSL_ENGINE=y
CONFIG_OPENSSL_PREFER_CHACHA_OVER_GCM=y
CONFIG_OPENSSL_WITH_ASM=y
CONFIG_OPENSSL_WITH_CHACHA_POLY1305=y
CONFIG_OPENSSL_WITH_CMS=y
CONFIG_OPENSSL_WITH_DEPRECATED=y
CONFIG_OPENSSL_WITH_ERROR_MESSAGES=y
CONFIG_OPENSSL_WITH_IDEA=y
CONFIG_OPENSSL_WITH_MDC2=y
CONFIG_OPENSSL_WITH_PSK=y
CONFIG_OPENSSL_WITH_SEED=y
CONFIG_OPENSSL_WITH_SRP=y
CONFIG_OPENSSL_WITH_TLS13=y
CONFIG_OPENSSL_WITH_WHIRLPOOL=y
CONFIG_PACKAGE_freeradius3=y
CONFIG_PACKAGE_freeradius3-common=y
CONFIG_PACKAGE_freeradius3-default=y
CONFIG_PACKAGE_freeradius3-democerts=y
CONFIG_PACKAGE_freeradius3-mod-always=y
CONFIG_PACKAGE_freeradius3-mod-attr-filter=y
CONFIG_PACKAGE_freeradius3-mod-chap=y
CONFIG_PACKAGE_freeradius3-mod-counter=y
CONFIG_PACKAGE_freeradius3-mod-date=y
CONFIG_PACKAGE_freeradius3-mod-detail=y
CONFIG_PACKAGE_freeradius3-mod-digest=y
CONFIG_PACKAGE_freeradius3-mod-dynamic-clients=y
CONFIG_PACKAGE_freeradius3-mod-eap=y
CONFIG_PACKAGE_freeradius3-mod-eap-fast=y
CONFIG_PACKAGE_freeradius3-mod-eap-gtc=y
CONFIG_PACKAGE_freeradius3-mod-eap-md5=y
CONFIG_PACKAGE_freeradius3-mod-eap-mschapv2=y
CONFIG_PACKAGE_freeradius3-mod-eap-peap=y
CONFIG_PACKAGE_freeradius3-mod-eap-pwd=y
CONFIG_PACKAGE_freeradius3-mod-eap-tls=y
CONFIG_PACKAGE_freeradius3-mod-eap-ttls=y
CONFIG_PACKAGE_freeradius3-mod-exec=y
CONFIG_PACKAGE_freeradius3-mod-expiration=y
CONFIG_PACKAGE_freeradius3-mod-expr=y
CONFIG_PACKAGE_freeradius3-mod-files=y
CONFIG_PACKAGE_freeradius3-mod-ippool=y
CONFIG_PACKAGE_freeradius3-mod-krb5=y
CONFIG_PACKAGE_freeradius3-mod-ldap=y
CONFIG_PACKAGE_freeradius3-mod-linelog=y
CONFIG_PACKAGE_freeradius3-mod-logintime=y
CONFIG_PACKAGE_freeradius3-mod-mschap=y
CONFIG_PACKAGE_freeradius3-mod-pam=y
CONFIG_PACKAGE_freeradius3-mod-pap=y
CONFIG_PACKAGE_freeradius3-mod-passwd=y
CONFIG_PACKAGE_freeradius3-mod-preprocess=y
CONFIG_PACKAGE_freeradius3-mod-python3=y
CONFIG_PACKAGE_freeradius3-mod-radutmp=y
CONFIG_PACKAGE_freeradius3-mod-realm=y
CONFIG_PACKAGE_freeradius3-mod-unix=y
CONFIG_PACKAGE_freeradius3-utils=y
CONFIG_PACKAGE_krb5-libs=y
CONFIG_PACKAGE_libatomic=y
CONFIG_PACKAGE_libattr=y
CONFIG_PACKAGE_libbz2=y
CONFIG_PACKAGE_libcap=y
CONFIG_PACKAGE_libcomerr=y
CONFIG_PACKAGE_libffi=y
CONFIG_PACKAGE_libgdbm=y
CONFIG_PACKAGE_liblzma=y
CONFIG_PACKAGE_libncurses=y
CONFIG_PACKAGE_libopenldap=y
CONFIG_PACKAGE_libopenssl=y
CONFIG_PACKAGE_libpam=y
CONFIG_PACKAGE_libpcap=y
CONFIG_PACKAGE_libpython3=y
CONFIG_PACKAGE_libreadline=y
CONFIG_PACKAGE_librt=y
CONFIG_PACKAGE_libsasl2=y
CONFIG_PACKAGE_libsqlite3=y
CONFIG_PACKAGE_libss=y
CONFIG_PACKAGE_libtalloc=y
CONFIG_PACKAGE_libuuid=y
CONFIG_PACKAGE_python3=y
CONFIG_PACKAGE_python3-asyncio=y
CONFIG_PACKAGE_python3-base=y
CONFIG_PACKAGE_python3-cgi=y
CONFIG_PACKAGE_python3-cgitb=y
CONFIG_PACKAGE_python3-codecs=y
CONFIG_PACKAGE_python3-ctypes=y
CONFIG_PACKAGE_python3-dbm=y
CONFIG_PACKAGE_python3-decimal=y
CONFIG_PACKAGE_python3-distutils=y
CONFIG_PACKAGE_python3-email=y
CONFIG_PACKAGE_python3-light=y
CONFIG_PACKAGE_python3-logging=y
CONFIG_PACKAGE_python3-lzma=y
CONFIG_PACKAGE_python3-multiprocessing=y
CONFIG_PACKAGE_python3-ncurses=y
CONFIG_PACKAGE_python3-openssl=y
CONFIG_PACKAGE_python3-pydoc=y
CONFIG_PACKAGE_python3-readline=y
CONFIG_PACKAGE_python3-sqlite3=y
CONFIG_PACKAGE_python3-unittest=y
CONFIG_PACKAGE_python3-urllib=y
CONFIG_PACKAGE_python3-uuid=y
CONFIG_PACKAGE_python3-xml=y
CONFIG_PACKAGE_terminfo=y
CONFIG_PACKAGE_zlib=y
CONFIG_SQLITE3_COLUMN_METADATA=y
CONFIG_SQLITE3_DYNAMIC_EXTENSIONS=y
CONFIG_SQLITE3_FTS3=y
CONFIG_SQLITE3_FTS4=y
CONFIG_SQLITE3_FTS5=y
CONFIG_SQLITE3_RTREE=y
