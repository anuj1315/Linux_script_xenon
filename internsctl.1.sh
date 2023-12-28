.TH INTERNSCTL 1 "December 2023" "v0.1.0" "internsctl manual"

.SH NAME
internsctl \- Custom Linux command for various operations

.SH SYNOPSIS
.B internsctl
.RB [OPTION] COMMAND [ARGS...]

.SH DESCRIPTION
.B internsctl
is a custom Linux command that provides various operations for system management.

.SH OPTIONS
.TP
.B \-\-version
Display the version of internsctl.

.TP
.B \-\-help
Display this help message.

.SH COMMANDS
.TP
.B cpu
Get CPU information.

.TP
.B memory
Get memory information.

.TP
.B user
Manage users on the system.

.TP
.B file
Get information about a file.

.SH EXAMPLES
.B internsctl \-\-version
Display the version of internsctl.

.B internsctl \-\-help
Display this help message.

.B internsctl cpu getinfo
Get CPU information.

.B internsctl memory getinfo
Get memory information.

.B internsctl user create <username>
Create a new user.

.B internsctl user list
List all regular users.

.B internsctl user list \-\-sudo\-only
List users with sudo permissions.

.B internsctl file getinfo <file-name>
Get information about a file.

.B internsctl file getinfo \-\-size <file-name>
Get the size of the specified file.

.B internsctl file getinfo \-\-permissions <file-name>
Get the permissions of the specified file.

.B internsctl file getinfo \-\-owner <file-name>
Get the owner of the specified file.

.B internsctl file getinfo \-\-last-modified <file-name>
Get the last modified time of the specified file.
                                                    
