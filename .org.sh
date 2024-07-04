#!/bin/bash

# Directory where your files are located
source_directory="./"

# Destination directories for different file types
photos_destination="./Photos"
pdf_destination="./PDFs"
mp4_destination="./Videos"
other_destination="./Other"

# Check if the destination directories exist, and create them if not
if [ ! -d "$photos_destination" ]; then
    mkdir -p "$photos_destination"
fi

if [ ! -d "$pdf_destination" ]; then
    mkdir -p "$pdf_destination"
fi

if [ ! -d "$mp4_destination" ]; then
    mkdir -p "$mp4_destination"
fi

if [ ! -d "$other_destination" ]; then
    mkdir -p "$other_destination"
fi

# Move photos (PNG, JPG, and JPEG) to the Photos directory
for file in "$source_directory"/*.png "$source_directory"/*.jpg "$source_directory"/*.jpeg; do
    if [ -e "$file" ]; then
        mv "$file" "$photos_destination"/
        echo "Moved $file to $photos_destination"
    else
        echo "File not found: $file"
    fi
done

# Move PDF files to the PDFs directory
for file in "$source_directory"/*.pdf; do
    if [ -e "$file" ]; then
        mv "$file" "$pdf_destination"/
        echo "Moved $file to $pdf_destination"
    else
        echo "File not found: $file"
    fi
done

# Move MP4 files to the Videos directory
for file in "$source_directory"/*.mp4; do
    if [ -e "$file" ]; then
        mv "$file" "$mp4_destination"/
        echo "Moved $file to $mp4_destination"
    else
        echo "File not found: $file"
    fi
done

# Move other files (excluding directories) to the Other directory
for file in "$source_directory"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$other_destination"/
        echo "Moved $file to $other_destination"
    else
        echo "Not a regular file: $file"
    fi
done
