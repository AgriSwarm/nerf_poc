#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 [video file] [output directory]"
    echo "  video file       - Path to the input video file"
    echo "  output directory - Path to the output directory"
    exit 1
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    usage
fi

# Check if help is requested
if [[ $1 == "-h" || $1 == "--help" ]]; then
    usage
fi

# Argument 1: Path to the input video file
video=$1

# Argument 2: Path to the output directory
output=$2

# Validate if the video file exists
if [ ! -f "$video" ]; then
    echo "Error: Video file '$video' not found."
    exit 1
fi

# Process data: Convert video to a format suitable for neural factoring
ns-process-data video --data "$video" --output-dir "$output" --sfm-tool hloc

# Train nerfacto model: Uses the processed data for training
ns-train nerfacto --vis viewer --data "$output"

# Export command commented out. Uncomment to enable export functionality.
# ns-export poisson --load-config outputs/test2/nerfacto/2024-01-17_191700/config.yml --output-dir exports/mesh/ --normal-output-name rgb
