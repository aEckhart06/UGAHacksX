import os
import shutil

def move_jpeg_files():
    # Define source and destination directories
    source_dir = "RockStarImages"
    dest_dir = "RockstarBandBuilder/RockstarBandBuilder/Assets.xcassets"

    # Create destination directory if it doesn't exist
    os.makedirs(dest_dir, exist_ok=True)

    # Loop through files in source directory
    for filename in os.listdir(source_dir):
        # Check if file is a JPEG
        if filename.lower().endswith(('.jpeg', '.jpg')):
            # Create full file paths
            source_file = os.path.join(source_dir, filename)
            dest_file = os.path.join(dest_dir, filename)
            
            try:
                # Move the file
                shutil.move(source_file, dest_file)
                print(f"Successfully moved {filename}")
            except Exception as e:
                print(f"Error moving {filename}: {str(e)}")

if __name__ == "__main__":
    move_jpeg_files()
