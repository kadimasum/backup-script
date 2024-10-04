

---

# Backup Script

## Overview

`script.sh` is a simple Bash script to back up files from a source directory to a destination directory. The script includes an option to zip the copied files at the destination.

## Features

- **Interactive prompts** for source and destination directories.
- **Validation** of the provided source and destination paths.
- **Optional compression** of files at the destination using a zip archive.

## Prerequisites

- **Bash**: This script is written for Bash and should be run in a compatible terminal.
- **zip**: The script requires `zip` to be installed on the system if you choose to compress the files.

## How to Use

1. **Run the Script:**
   ```bash
   ./script.sh
   ```

2. **Provide Inputs When Prompted:**

   - **Source path**: Enter the path of the directory you want to back up (e.g., `/home/user/documents` or `~/documents`).
   
   - **Destination path**: Enter the destination directory path where the files should be copied (e.g., `/home/user/backup` or `~/backup`).
   
   - **Zip option**: Choose whether to zip the files after copying them to the destination by entering `yes` or `no`.

### Example Usage:

```bash
Backup Script
Enter source path: /home/user/documents
Enter destination path: /home/user/backup
Do you want to zip files in the destination location? (yes/no): yes
```

This will copy all the files from `/home/user/documents` to `/home/user/backup`, and then create a `backup.zip` archive at the destination.

## Script Breakdown

1. **User Input:**
   - The script prompts the user for a source path, destination path, and zip option using `read -p`.
   - If no source or destination is provided, the script exits with an error.

2. **Path Expansion:**
   - If paths contain `~` (tilde), it is expanded to the full home directory using `eval echo`.

3. **Path Validation:**
   - The script checks if the provided source and destination paths exist and are valid directories using `[[ -d ]]`.

4. **Copying Files:**
   - The `cp -r` command is used to recursively copy all files and subdirectories from the source to the destination.

5. **Zipping Files:**
   - If the user chooses to zip the files, the `zip -r` command is used to create a `backup.zip` file in the destination.

## Error Handling

- The script validates if the source and destination paths are valid directories.
- If the paths are invalid or missing, the script exits with an error message.
- If an error occurs during file copying or zipping, the script provides a corresponding error message.

## Notes

- The destination directory must exist before running the script for successful backup.
- The `backup.zip` file will contain all copied files if zipping is enabled.

## License

This script is open-source and available under the MIT License.

---

### How to Run

Make sure the script has executable permissions:
```bash
chmod +x script.sh
```

Then run it:
```bash
./script.sh
```

--- 

