#!/bin/bash

# internsctl - Custom Linux command for various operations
# Version: v0.1.0

# Function to display the manual page
display_manual() {
    man ./internsctl.1
}

# Function to display version
display_version() {
    echo "internsctl v0.1.0"
}

# Function to display help
display_help() {
    echo "Usage: internsctl {--help|--version|cpu|memory|user|file} [options] [args]"
    echo "Use 'internsctl --help' to get detailed information about the command."
}

# Function to handle undefined commands
handle_undefined_command() {
    echo "Error: Undefined command '$1'."
    display_help
    exit 1
}

# Function to get CPU information
get_cpu_info() {
    lscpu
}

# Function to get memory information
get_memory_info() {
    free -h
}

# Function to create a new user
create_user() {
    if [ $# -ne 1 ]; then
        echo "Usage: internsctl user create <username>"
        exit 1
    fi

    USERNAME=$1
    sudo useradd -m $USERNAME
    sudo passwd $USERNAME
}

# Function to list users
list_users() {
    if [ "$1" == "--sudo-only" ]; then
        getent passwd | grep -E 'sudo|admin' | cut -d: -f1
    else
        getent passwd | cut -d: -f1
    fi
}
# Function to get file information
get_file_info() {
    if [ $# -lt 1 ]; then
        echo "Usage: internsctl file getinfo [options] <file-name>"
        exit 1
    fi

    FILENAME=$1
    if [ ! -e "$FILENAME" ]; then
        echo "Error: File not found - $FILENAME"
        exit 1
    fi

    SIZE=$(stat -c %s "$FILENAME")
    PERMISSIONS=$(stat -c %A "$FILENAME")
    OWNER=$(stat -c %U "$FILENAME")
    LAST_MODIFIED=$(stat -c %y "$FILENAME")

    case "$2" in
        --size|-s)
            echo $SIZE
            ;;
        --permissions|-p)
            echo $PERMISSIONS
            ;;
        --owner|-o)
            echo $OWNER
            ;;
        --last-modified|-m)
            echo $LAST_MODIFIED
            ;;
        *)
            echo "File: $FILENAME"
            echo "Access: $PERMISSIONS"
            echo "Size(B): $SIZE"
            echo "Owner: $OWNER"
            echo "Modify: $LAST_MODIFIED"
            ;;
    esac
}


# Main script logic
case "$1" in
    --help)
        display_manual
        ;;
    --version)
        display_version
        ;;
    cpu)
        shift
        get_cpu_info "$@"
        ;;
    memory)
        shift
        get_memory_info "$@"
        ;;
    user)
        shift
        case "$1" in
            create)
                shift
                create_user "$@"
                ;;
            list)
                shift
                list_users "$@"
                ;;
            *)
                echo "Usage: internsctl user {create|list}"
                exit 1
                ;;
        esac
        ;;
    file)
        shift
        get_file_info "$@"
        ;;
    *)
        handle_undefined_command "$1"
        ;;
esac

