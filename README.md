# it-automation-scripts

A collection of practical automation scripts for common IT tasks, implemented in **Bash**, **PowerShell**, and **Python**. These scripts aim to simplify routine maintenance and monitoring activities such as cleaning temporary files, checking disk usage, network status, system updates, health checks, and more.

---

## Structure

- **bash/** – Bash scripts for macOS/Linux automation
- **powershell/** – PowerShell Core scripts (cross-platform)
- **python/** – Python-based utilities

---

## Getting Started

### Prerequisites

- macOS or Linux environment (tested primarily on macOS)
- [Git](https://git-scm.com/) installed
- **For Bash scripts:**
  - Run: `chmod +x script-name.sh` to allow execution
- **For PowerShell scripts:**
  - Install [PowerShell Core](https://github.com/PowerShell/PowerShell)

---

## Installation

```bash
git clone https://github.com/ellaa555/it-automation-scripts.git
cd it-automation-scripts
```

## Usage
Naviage to the appropriate folder:
```
cd bash           # For Bash scripts
cd powershell     # For PowerShell scripts
```
Then run a script:
```
./clear-temp.sh
./mac-system-health-report.sh
```
or for PowerShell:
```
./system-health-report.ps1
./random-equation.ps1
```

### Script Overview
## Bash Scripts:
| Script Name                   | Description                                               |
| ----------------------------- | --------------------------------------------------------- |
| `clear-temp.sh`               | Deletes temporary files older than 30 days                |
| `disk-usage-check.sh`         | Checks disk space usage and alerts if low                 |
| `network-status.sh`           | Displays active network interfaces and IPs                |
| `update-system.sh`            | Runs macOS system software updates                        |
| `backup-home.sh`              | Creates a backup archive of the user’s home directory     |
| `mac-system-health-report.sh` | Generates a system health summary report (CPU, RAM, Disk) |
| `report.txt`                  | Sample output from health report for review               |

## PowerShell Scripts:
| Script Name                      | Description                                  |
| -------------------------------- | -------------------------------------------- |
| `system-health-report.ps1`       | Gathers system status info for Windows/macOS |
| `monitor-internetconnection.ps1` | Logs and alerts on internet disconnection    |
| `random-equation.ps1`            | Generates and solves random math equations   |

## Python Scripts:
(TBD)



