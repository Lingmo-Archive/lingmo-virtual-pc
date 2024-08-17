osinfo_db = [
  ['archlinux-rolling.xml', 'lingmo-virtualpc/osinfo/os/archlinux.org'],
  ['centos-7.0.xml', 'lingmo-virtualpc/osinfo/os/centos.org'],
  ['centos-stream-9.xml', 'lingmo-virtualpc/osinfo/os/centos.org'],
  ['debian-4.xml', 'lingmo-virtualpc/osinfo/os/debian.org'],
  ['eos-3.3.xml', 'lingmo-virtualpc/osinfo/os/endlessos.com'],
  ['fedora-1.xml', 'lingmo-virtualpc/osinfo/os/fedoraproject.org'],
  ['freedos-1.2.xml', 'lingmo-virtualpc/osinfo/os/freedos.org'],
  ['lingmo.xml', 'lingmo-virtualpc/osinfo/os/lingmo.org'],
  ['guix-1.3.xml', 'lingmo-virtualpc/osinfo/os/guix.gnu.org'],
  ['manjaro-19.0.xml', 'lingmo-virtualpc/osinfo/os/manjaro.org'],
  ['nixos-20.03.xml', 'lingmo-virtualpc/osinfo/os/nixos.org'],
  ['opensuse-10.2.xml', 'lingmo-virtualpc/osinfo/os/opensuse.org'],
  ['ubuntu-4.10.xml', 'lingmo-virtualpc/osinfo/os/ubuntu.com'],
  ['popos-17.10.xml', 'lingmo-virtualpc/osinfo/os/system76.com'],
  ['rhel-8.0.xml', 'lingmo-virtualpc/osinfo/os/redhat.com'],
  ['rocky-8.4.xml', 'lingmo-virtualpc/osinfo/os/rockylinux.org'],
  ['silverblue-28.xml', 'lingmo-virtualpc/osinfo/os/fedoraproject.org'],
  ['trisquel-9.xml', 'lingmo-virtualpc/osinfo/os/trisquel.info']
]

foreach os: osinfo_db
  install_data (os[0], install_dir : join_paths (data_dir, os[1]))
endforeach
