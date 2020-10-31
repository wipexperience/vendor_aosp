#!/sbin/ash
source /tmp/install/bin/mount_functions.sh

export bb="$TMP/busybox"

setenforce 0

for f in busybox unzip; do
  chmod +x "$TMP/$f"
done

if [ -e "$bb" ]; then
  for i in $($bb --list); do
    if ! ln -sf "$bb" "$TMP/$i" && ! $bb ln -sf "$bb" "$TMP/$i" && ! $bb ln -f "$bb" "$TMP/$i"; then
      # create script wrapper if symlinking and hardlinking failed because of restrictive selinux policy
      if ! echo "#!$bb" > "$TMP/$i" || ! chmod +x $i ; then
        ui_print "Error: Failed to set-up pre-bundled busybox"
        exit 1
      fi
    fi
  done
  exit 0
else
  ui_print "Error: Wrong architecture to set-up pre-bundled busybox"
  exit 1
fi
