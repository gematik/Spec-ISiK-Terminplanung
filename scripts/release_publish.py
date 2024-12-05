import datetime
import re
import subprocess
import os
import argparse
from datetime import date
import yaml


class FileTypeCombinationToUpdate:
    def __init__(self, filename, content_type, regex_list, format=None) -> None:
        self.filename = filename
        self.content_type = content_type
        self.regex_list = regex_list
        self.format = format
        self.location = None

    def set_file_location(self, location):
        self.location = location


def load_config_file(config_file_path):
    with open(config_file_path, 'r') as config_file:
        return yaml.safe_load(config_file)

def get_new_release_version_from_branch_name() -> str:
    git_branch = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD']).strip().decode()
    return git_branch


def modify_TC_branch_name_to_version(git_branch): 
    if git_branch.startswith('TC-'):
        version = git_branch.lstrip('TC-')
    elif git_branch.startswith('TC_'):
        version = git_branch.lstrip('TC_')
    return version

def create_files_to_update_list(config):
    files_to_update = []
    for filename, replacements in config.items():
        for replacement in replacements:
            files_to_update.append(
                FileTypeCombinationToUpdate(
                    filename,
                    replacement["type"],
                    replacement["regex"] if isinstance(replacement["regex"], list) else [replacement["regex"]],
                    replacement.get("format", None),
                )
            )
    return files_to_update


def locate_files_in_current_project(files: list):
    located_files = []
    for current_file in files:
        file_location = find_file(current_file.filename, ".")
        if file_location is not None:
            current_file.set_file_location(file_location)
            located_files.append(current_file)
        else:
            print(f"Warning: File '{current_file.filename}' not found.")
    return located_files


def find_file(name, path="."):
    for root, dirs, files in os.walk(path):
        if name in files:
            print(f"Info: Found '{name}' in {root}.")
            return os.path.join(root, name)
    return None


def replace_content_in_files(files: list, new_release_version: str, new_date: datetime):
    if files is None:
        print("Error: No files found!")
        return

    for FileTypeCombination in files:
        if FileTypeCombination.content_type == "version":
            replace_version_in_file(FileTypeCombination, new_release_version)
        elif FileTypeCombination.content_type == "date":
            replace_date_in_file(FileTypeCombination, new_date)


def replace_version_in_file(file: FileTypeCombinationToUpdate, new_release_version: str):
    with open(file.location, 'r') as input_file:
        input_text = input_file.read()

    for regex in file.regex_list:
        input_text = re.sub(regex, rf'\g<1>{new_release_version}\g<3>', input_text)

    print(f"Info: Replaced version with '{new_release_version}' in file '{file.location}'.")

    with open(file.location, 'w') as output_file:
        output_file.write(input_text)


def replace_date_in_file(file: FileTypeCombinationToUpdate, new_date: datetime):
    with open(file.location, 'r') as input_file:
        input_text = input_file.read()

    for regex in file.regex_list:
        input_text = re.sub(regex, rf'\g<1>{new_date.strftime(file.format)}\g<3>', input_text)

    print(f"Info: Replaced date with '{new_date.strftime(file.format)}' in file '{file.location}'.")

    with open(file.location, 'w') as output_file:
        output_file.write(input_text)

def output_commit_messages_since_last_release():
    latest_release_tag = get_latest_release_tag()
    if latest_release_tag is None:
        print("Warning: No release tag found.")
        return

    cmd = f'git log --pretty=format:"%s" {latest_release_tag}..HEAD'
    try:
        output = subprocess.check_output(cmd, shell=True)
        print(output.decode())
    except subprocess.CalledProcessError:
        print("Warning: Failed to get commit messages.")

def get_latest_release_tag():
    cmd = 'git describe --abbrev=0 --tags --match "v*.*.*" HEAD'
    try:
        output = subprocess.check_output(cmd, shell=True)
        return output.decode().strip()
    except subprocess.CalledProcessError:
        return None


def main():
    parser = argparse.ArgumentParser(description='Update release version number and date')
    parser.add_argument('-b', '--branch', action='store_true', help='get new version from branch name')
    parser.add_argument('-v', '--version', type=str, help='specify new version number')
    parser.add_argument('-d', '--date', type=str, help='specify custom date for release')
    parser.add_argument('-c', '--config', type=str, default='config.yaml', help='specify config file')
    parser.add_argument('-o', '--output', action='store_true', help='output commit messages since last release')
    args = parser.parse_args()

    if args.version:
        new_release_version = args.version
    elif args.branch:
        new_release_version = get_new_release_version_from_branch_name()
        if new_release_version.startswith('TC'):
            new_release_version = modify_TC_branch_name_to_version(new_release_version)
    else:
        parser.error('No new release version specified. Please use either -v or -b to specify the new release version.')

    if args.date:
        custom_date = datetime.datetime.strptime(args.date, '%d.%m.%Y').date()
    else:
        custom_date = date.today()

    config_file_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), args.config)
    config = load_config_file(config_file_path)
    files_to_update = create_files_to_update_list(config)
    located_files = locate_files_in_current_project(files_to_update)
    replace_content_in_files(located_files, new_release_version, custom_date)

    if args.output:
        output_commit_messages_since_last_release()

if __name__ == "__main__":
    main()