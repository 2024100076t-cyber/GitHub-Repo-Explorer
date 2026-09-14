[README.md](https://github.com/user-attachments/files/32188234/README.md)
# GitHub-Repo-Explorer# GitHub Repo Explorer

A command-line tool built in Dart that fetches and displays repository data from the GitHub API. Users can query any public repository by owner and name to see its stats and metadata.

## Project Structure
This project is organized as a Dart workspace containing three packages:

| Package | Purpose |
|---|---|
| `github_cli` | The command-line application. Parses user input and prints a formatted audit report. |
| `github_api` | A client library that communicates with the GitHub API and models the returned data. |
| `terminal_colors` | A helper package used to add colored output to the terminal for better readability. |

## Features
- Fetch repository data by owner/repo (e.g. `torvalds/linux`)
- Displays star count, fork count, open issue count, and description
- Colored terminal output for easier reading
- Clear error handling for invalid input or API errors
- Works interactively (prompts for input) or via command-line argument

## Requirements
Dart SDK ^3.8.1 or higher

## Installation
Clone this repository:
```
git clone https://github.com/2024100076t-cyber/Fligth_location_radar.git
cd "GitHub Repo Explorer"
```

Get the dependencies:
```
dart pub get
```

## Usage
Run the CLI from the `github_cli` package:
```
dart run github_cli/bin/github_cli.dart owner/repo
```

Or run it without an argument to be prompted interactively:
```
dart run github_cli/bin/github_cli.dart
```

## Example
Fetch stats for a repository:
```
dart run github_cli/bin/github_cli.dart 2024100122t-prog/US_Census_Demographic_Explorer
```

## Author
Created as a class project by [your name here].

## About
A Dart CLI tool for auditing GitHub repositories — stars, forks, issues, and description at a glance.
