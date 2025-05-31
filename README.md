# it-automation-scripts

A collection of practical automation scripts for common IT tasks, implemented in Bash, PowerShell, and Python. These scripts aim to simplify routine maintenance and monitoring activities such as cleaning temporary files, checking disk usage, network status, system updates, and log management.

## Getting Started

These instructions will help you set up the environment and run the scripts on your local machine.

### Prerequisites

- macOS or Linux environment (scripts tested primarily on macOS)
- Git installed
- For Bash scripts, ensure execution permissions are set (`chmod +x script-name.sh`)
- PowerShell scripts require PowerShell Core installed on your system

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/ellaa555/it-automation-scripts.git
    cd it-automation-scripts
    ```

2. Navigate to the `bash` directory (or respective folder for other scripts):
    ```bash
    cd bash
    ```

3. Make scripts executable:
    ```bash
    chmod +x *.sh
    ```

### Usage

Run any script from the terminal by specifying the script name, for example:

```bash
./clear-temp.sh
./disk-usage-check.sh
```

### Script Overview

| Script Name           | Description                                |
| --------------------- | ------------------------------------------ |
| `clear-temp.sh`       | Deletes temporary files older than 30 days |
| `disk-usage-check.sh` | Checks disk space usage and alerts if low  |
| `network-status.sh`   | Displays active network interfaces and IPs |
| `update-system.sh`    | Runs macOS system software updates         |
| `log-cleanup.sh`      | Archives and clears old log files          |


