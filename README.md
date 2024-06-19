# copymaster

A utility for copying files using rclone on a cronjob.

## Environment Variables

- `SOURCE` - Source location to copy files from.
- `TARGET` - Target location to copy files to.
- `EXCLUDE` - Regex of files to exclude when copying.

## rclone Configuration

Add a volume to location `/root/.config/rclone` to set and modify the rclone config. There should be a file under this volume with name `rclone.conf`.
