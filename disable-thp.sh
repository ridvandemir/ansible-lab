#!/bin/sh
### BEGIN INIT INFO
# Provides:          disable-transparent-hugepages
# Required-Start:    $local_fs
# Required-Stop:
# X-Start-Before:    splunk
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Disable Linux transparent huge pages
# Description:       Disable Linux transparent huge pages, to improve
#                    database performance.
### END INIT INFO

get_path () {
  if [ -d /sys/kernel/mm/transparent_hugepage ]; then
    echo /sys/kernel/mm/transparent_hugepage
  elif [ -d /sys/kernel/mm/redhat_transparent_hugepage ]; then
    echo /sys/kernel/mm/redhat_transparent_hugepage
  else
    exit 1
  fi
}

case $1 in
  start)
    thp_path=$(get_path)

    echo 'never' > ${thp_path}/enabled
    echo 'never' > ${thp_path}/defrag

    unset thp_path
    ;;
  status)
    thp_path=$(get_path)

    read e_always e_madvise e_never < ${thp_path}/enabled
    read d_always d_madvise d_never < ${thp_path}/defrag

    if [ "$e_never" != "[never]" ] || [ "$d_never" != "[never]" ]; then
      exit 1
    fi

    unset thp_path

    echo "OK"
    exit 0
    ;;
esac