# SSH Key Management Script

This repository contains a simple bash script for automating the distribution, revocation, and listing of SSH keys across multiple Linux servers.

## Features

- **Add SSH Key**: Distribute an SSH public key to multiple servers.
- **Remove SSH Key**: Revoke an SSH public key from multiple servers.
- **List SSH Keys**: List all authorized SSH keys on a specific server.

## How It Works

### Script (`ssh_key_management.sh`)

- **SERVERS**: List of servers where the SSH key will be added or removed.
- **USER**: The username to connect to the servers.
- **SSH_KEY**: The path to the public SSH key to distribute or revoke.
- **Logging**: Logs the actions taken (adding, removing keys) in `/var/log/ssh_key_management.log`.

## Usage

1. Make the script executable:
    ```bash
    chmod +x ssh_key_management.sh
    ```

2. To add an SSH key to all servers:
    ```bash
    ./ssh_key_management.sh add
    ```

3. To remove an SSH key from all servers:
    ```bash
    ./ssh_key_management.sh remove
    ```

4. To list all authorized keys on all servers:
    ```bash
    ./ssh_key_management.sh list
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
