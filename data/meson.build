icondir = join_paths('icons', 'hicolor', 'scalable', 'apps')
install_data(
  join_paths(icondir, ('@0@.svg').format(application_id)),
  install_dir: join_paths(data_dir, icondir),
  rename: '@0@.svg'.format(application_id)
)

icondir = join_paths('icons', 'hicolor', 'symbolic', 'apps')
install_data(
  join_paths(icondir, 'org.lingmo.VirtualPC-symbolic.svg'),
  install_dir: join_paths(data_dir, icondir),
  rename: '@0@-symbolic.svg'.format(application_id)
)

resource_files = files ('lingmo-virtualpc.gresource.xml')
resources = lingmo.compile_resources ('org.lingmo.VirtualPC',
                                     resource_files,
                                     c_name: 'resources')

desktop_conf = configuration_data ()
desktop_conf.set ('icon', application_id)
desktop = i18n.merge_file (
  input: configure_file (
    input: files ('org.lingmo.VirtualPC.desktop.in'),
    output: 'org.lingmo.VirtualPC.desktop.in',
    configuration: desktop_conf
  ),
  output: '@0@.desktop'.format(application_id),
  install: true,
  install_dir: join_paths (data_dir, 'applications'),
  po_dir: po_dir,
  type: 'desktop'
)
desktop_file_validate = find_program ('desktop-file-validate', required: false)
if desktop_file_validate.found()
  test(
    'validate-desktop',
    desktop_file_validate,
    args: [
      desktop.full_path()
    ]
  )
endif

dbus_conf = configuration_data ()
dbus_conf.set ('bindir', join_paths (get_option ('prefix'), get_option ('bindir')))
dbus_conf.set ('libexecdir', join_paths (get_option ('prefix'), get_option ('libexecdir')))
dbus_conf.set ('appid', application_id)
configure_file (
  input: 'org.lingmo.VirtualPC.service.in',
  output: '@0@.service'.format (application_id),
  configuration: dbus_conf,
  install: true,
  install_dir: join_paths (data_dir, 'dbus-1', 'services')
)

configure_file (
  input: 'org.lingmo.VirtualPC.SearchProvider.service.in',
  output: 'org.lingmo.VirtualPC.SearchProvider.service',
  configuration: dbus_conf,
  install: true,
  install_dir: join_paths (data_dir, 'dbus-1', 'services')
)

appdata_conf = configuration_data()
appdata_conf.set('appid', application_id)
appdata_file = i18n.merge_file (
  input: configure_file (
    input: files ('org.lingmo.VirtualPC.appdata.xml.in'),
    output: 'org.lingmo.VirtualPC.appdata.xml.in',
    configuration: appdata_conf
  ),
  output: '@0@.appdata.xml'.format (application_id),
  po_dir: po_dir,
  install: true,
  install_dir: join_paths (data_dir, 'metainfo')
)
appstreamcli = find_program('appstreamcli', required: false)
if appstreamcli.found()
  test(
    'validate-appdata', appstreamcli,
    args: [
      'validate', '--no-net', '--explain', appdata_file.full_path()
    ]
  )
endif

gsettings_conf = configuration_data ()
gsettings_conf.set ('GETTEXT_PACKAGE', meson.project_name ())
configure_file (
  input: 'org.lingmo.virtualpc.gschema.xml',
  output: 'org.lingmo.virtualpc.gschema.xml',
  configuration: gsettings_conf,
  install: true,
  install_dir: join_paths(data_dir, 'glib-2.0', 'schemas'),
)

search_provider_conf = configuration_data()
search_provider_conf.set ('appid', application_id)
search_provider_conf.set ('profile', profile)
configure_file (
  configuration: search_provider_conf,
  input: files ('lingmo-virtualpc-search-provider.ini'),
  install_dir: join_paths (data_dir, 'lingmo-shell', 'search-providers'),
  output: '@0@.SearchProvider.ini'.format (application_id)
)

install_data ('QEMU_Session', install_dir : join_paths (data_dir, 'lingmo-virtualpc/sources'))
install_data ('disk.img', install_dir : join_paths (data_dir, 'lingmo-virtualpc/unattended'))

subdir ('osinfo')
