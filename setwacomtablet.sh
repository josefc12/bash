#! /usr/bin/bash

echo "Setting wacom..."
# Get the output of `xsetwacom --list devices` and store it in a variable
device_list=$(xsetwacom --list devices)

# Loop through each line of the output
while IFS= read -r line; do
	# Extract the ID
	id=$(echo "$line" | grep -oP 'id: \K\d+')

	xsetwacom --set "$id" MapToOutput HEAD-0
	echo "Mapped ID: $id"
done <<< "$device_list"
