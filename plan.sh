pkg_name=service-bind
pkg_origin=predominant
pkg_version=1.0.0
pkg_maintainer="Graham Weldon <graham@grahamweldon.com>"
pkg_license=('None')

pkg_deps=(
  core/busybox-static
)

pkg_exports=(
  [mysql_host]=mysql.host
  [mysql_port]=mysql.port
  [mysql_user]=mysql.user
  [mysql_pass]=mysql.pass
  [mysql_db]=mysql.db
  [elasticsearch]=elasticsearch.uri
  [rabbitmq_host]=rabbitmq.host
  [rabbitmq_port]=rabbitmq.port
  [rabbitmq_queue]=rabbitmq.queue
  [rabbitmq_user]=rabbitmq.user
  [rabbitmq_pass]=rabbitmq.pass
)

do_begin() {
  return 0
}

do_build() {
  return 0
}

update_pkg_version() {
  return 0
}

do_download() {
  return 0
}

do_install() {
  return 0
}

do_prepare() {
  return 0
}

do_unpack() {
  return 0
}
