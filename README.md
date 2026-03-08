# P6's POSIX.2: p6df-superset

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

Integrates Apache Superset into the p6df shell framework. Provides `profile::on` /
`profile::off` for managing `SUPERSET_URL`, username, and password, plus MCP server
installation.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-superset

##### p6df-superset/init.zsh

- `p6df::modules::superset::deps()`
- `p6df::modules::superset::mcp()`
  - Synopsis: Installs Apache Superset MCP server
- `p6df::modules::superset::profile::off()`
- `p6df::modules::superset::profile::on(profile, [env_or_url=http://localhost:8088], [username=admin], [password=])`
  - Args:
    - profile
    - OPTIONAL env_or_url - [http://localhost:8088]
    - OPTIONAL username - [admin]
    - OPTIONAL password - []

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
