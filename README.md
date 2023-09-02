# AO-Mini Project

## Overview

The AO-Mini project aims to provide a lightweight, offline-first content management system based on a filesystem directory structure. Designed for content creators, knowledge workers, and developers, the project offers a set of base scripts and tooling to create, manage, and interact with a hierarchical knowledge base. It supports content import from various sources like Reddit, and provides an organizational model based on boards, comments, and posts.

## Features

- **Directory Structure**: Organize your boards, comments, and posts in an intuitive directory hierarchy.
- **Bash Tooling**: A collection of Bash scripts for CRUD (Create, Read, Update, Delete) operations and more.
- **YAML Support**: Import existing content from YAML files.
- **Offline-First**: No need for an active internet connection to manage your content.
  
## Getting Started

1. **Installation**: Clone the repository and navigate to its directory.
\`\`\`
git clone https://github.com/your-username/ao-mini.git
cd ao-mini
\`\`\`

2. **Set up Environment**: Run the setup script.
\`\`\`
./setup.sh
\`\`\`

3. **Usage**: Use the provided Bash scripts to start managing your content.

## Importing Data

### Reddit YAML Import

The project offers a script for importing Reddit data in YAML format. Data is converted into the directory structure used by AO-Mini, allowing seamless integration of online discussions into your offline knowledge base.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- OpenAI's GPT-4 for inspiration and guidance in shaping the development tooling and methodology.
