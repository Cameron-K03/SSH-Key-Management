#!/bin/bash

# Configurable variables
SERVERS=("server1.example.com" "server2.example.com")
USER="your-username"
SSH_KEY="$HOME/.ssh/id_rsa.pub"
ACTION=$1
KEY_CONTENT=$(cat $SSH_KEY)
LOG_FILE="/var/log/ssh_key_management.log"

# Function to log messages
log_message() {
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - $1" >> $LOG_FILE
}

# Function to add an SSH key
add_key() {
    for server in "${SERVERS[@]}"; do
        ssh "$USER@$server" "mkdir -p ~/.ssh && echo '$KEY_CONTENT' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
        if [ $? -eq 0 ]; then
            log_message "Key added to $server."
        else
            log_message "Failed to add key to $server."
        fi
    done
}

# Function to remove an SSH key
remove_key() {
    for server in "${SERVERS[@]}"; do
        ssh "$USER@$server" "sed -i '/$KEY_CONTENT/d' ~/.ssh/authorized_keys"
        if [ $? -eq 0 ]; then
            log_message "Key removed from $server."
        else
            log_message "Failed to remove key from $server."
        fi
    done
}

# Function to list all SSH keys on a server
list_keys() {
    for server in "${SERVERS[@]}"; do
        echo "Keys on $server:"
        ssh "$USER@$server" "cat ~/.ssh/authorized_keys"
    done
}

# Main script logic
case $ACTION in
    add)
        add_key
        ;;
    remove)
        remove_key
        ;;
    list)
        list_keys
        ;;
    *)
        echo "Usage: $0 {add|remove|list}"
        ;;
esac
